
-- 品牌表
CREATE TABLE `eb_brand` (
  `brand_id` decimal(20,0) NOT NULL,
  `brand_name` varchar(255) DEFAULT NULL,
  `brand_desc` varchar(255) DEFAULT NULL,
  `imgs` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `brand_sort` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
