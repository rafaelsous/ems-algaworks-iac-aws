resource "aws_vpc" "algadelivery" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name        = var.vpc_name
    Environment = var.environment
    ManagedBy   = "OpenTofu"
  }
}

resource "aws_subnet" "public" {
  for_each          = var.subnet_pub_config
  vpc_id            = aws_vpc.algadelivery.id
  cidr_block        = each.value.cidr_block
  availability_zone = "${var.aws_region}${each.value.az}"

  tags = merge(local.common_tags, {
    Name = "${local.context_name}-pub-${each.value.az}"
  })
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.algadelivery.id

  route {
    cidr_block = local.internet_cidr_block
    gateway_id = aws_internet_gateway.algadelivery.id
  }

  tags = merge(local.common_tags, {
    Name = "${local.context_name}-route-table-pub"
  })
}

resource "aws_route_table_association" "public" {
  for_each       = aws_subnet.public
  subnet_id      = each.value.id
  route_table_id = aws_route_table.public.id
}

resource "aws_internet_gateway" "algadelivery" {
  vpc_id = aws_vpc.algadelivery.id

  tags = merge(local.common_tags, {
    Name = "${local.context_name}-igw"
  })
}

resource "aws_subnet" "private_management" {
  for_each          = var.subnet_private_management_config
  vpc_id            = aws_vpc.algadelivery.id
  cidr_block        = each.value.cidr_block
  availability_zone = "${var.aws_region}${each.value.az}"

  tags = merge(local.common_tags, {
    Name = "${local.context_name}-priv-mgmt-${each.value.az}"
  })
}

resource "aws_subnet" "private_cluster" {
  for_each          = var.subnet_private_cluster_config
  vpc_id            = aws_vpc.algadelivery.id
  cidr_block        = each.value.cidr_block
  availability_zone = "${var.aws_region}${each.value.az}"

  tags = merge(local.common_tags, {
    Name = "${local.context_name}-priv-cluster-${each.value.az}"
  })
}

resource "aws_nat_gateway" "algadelivery" {
  vpc_id            = aws_vpc.algadelivery.id
  availability_mode = local.ngw_regional_mode

  tags = merge(local.common_tags, {
    Name = "${local.context_name}-ngw"
  })
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.algadelivery.id

  route {
    cidr_block     = local.internet_cidr_block
    nat_gateway_id = aws_nat_gateway.algadelivery.id
  }

  tags = merge(local.common_tags, {
    Name = "${local.context_name}-route-table-private"
  })
}

resource "aws_route_table_association" "private_management" {
  for_each       = aws_subnet.private_management
  subnet_id      = each.value.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_cluster" {
  for_each       = aws_subnet.private_cluster
  subnet_id      = each.value.id
  route_table_id = aws_route_table.private.id
}