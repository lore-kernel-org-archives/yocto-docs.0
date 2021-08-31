Received: from EUR02-AM5-obe.outbound.protection.outlook.com (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.72])
 by mx.groups.io with SMTP id smtpd.web08.2623.1630397569824760247
 for <docs@lists.yoctoproject.org>;
 Tue, 31 Aug 2021 01:12:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=NXi3+F6N;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.0.72, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i+Bn22VAXhoZp0lue9d3JbyC5P9Mu6Yj+nqaojXvA91AI7F9H1ppmQ/z09yz5ad/XlbPs/sHe35AN9bO9fc3ylEgSTe3Cx4MCnG39OQrQC2cbZPQWJqvn8E9D58hXSIEUmfdjUnavC66yuVuoFgxLFpLg7dgB1PfHjLCcAeZBkXHsTQW5Q4FhKDmBcHnwkOLnhrIBQOyN7P2sBAf4j4C3RmTJDlmMNDCUfTiAedbpUATBNk7rIv9sfjbb6juMboW8EA4HWKMg1tWgGkkhZYyXH9sAWKi/x5guRFxOX44mGpfhUFqb+UU3IKJfJVllIXZjeyj7zYjNy2CgUy6Kg75BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HALYNsZVOC8MprkMhIr6611YcDh8TA43oxNfDg1RoLQ=;
 b=bdDHYOep/AwSzdLpwWi7ttIGg7SDMGX9fHsNypspHFnA5Eru8umVpkq31+NehQ9dMro6fEQBikQXnEm5GYmcdUaQOQPz028FcIo/5bJokOCOqLGMg7nwC7mkCIkyQ2+L5sEyuY+g89MtUeaS4JrytrSj4wrEkEDHNqrJ08GRdlcFKxjKglTQMgjuGTDCfL5R9rfMKVlbzgeiuhTXzVndfVVRxaZWVyD2Ikw0sGGwathkTaFBD2DlyHwTL0eKUfY95+CGcTu8+0i7WcxvXrnPw7s02hMSdvhK7APr5yuZ6q99jHwwuXQb0EuHyiwkfd0HiC7HOy/Fenk2gKjWJolreg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HALYNsZVOC8MprkMhIr6611YcDh8TA43oxNfDg1RoLQ=;
 b=NXi3+F6N6kvUqOJbVXyqxhtbFV3ZKfAZLgNU8Wddduv3p1iSOFcYvuDfUD80V5UjT9qBFcDt/8jJtESkBYYYdPEdga7BTrzKUy9RU6+CKb3p8zRjU2c7A++ZS3vDlLCwJS3zVIFkAh7Jo+WOYXd4hk2X9Y12bqsagEWBhtVKEfw=
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM8PR04MB7283.eurprd04.prod.outlook.com
 (2603:10a6:20b:1c7::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.24; Tue, 31 Aug
 2021 08:12:47 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::706a:b082:742a:7d00]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::706a:b082:742a:7d00%6]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 08:12:47 +0000
Date: Tue, 31 Aug 2021 10:12:45 +0200
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] dev-manual: explicit that devpyshell is a task
Message-ID: <20210831081245.o5od4ngeoepl2sww@fedora>
References: <20210830141750.66210-1-michael.opdenacker@bootlin.com>
In-Reply-To: <20210830141750.66210-1-michael.opdenacker@bootlin.com>
X-ClientProxiedBy: FR0P281CA0013.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::18) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by FR0P281CA0013.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.10 via Frontend Transport; Tue, 31 Aug 2021 08:12:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 666a3520-e6d8-462d-d69a-08d96c571dd1
X-MS-TrafficTypeDiagnostic: AM8PR04MB7283:
X-Microsoft-Antispam-PRVS: 
	<AM8PR04MB7283294B3E382C0249AFD656C2CC9@AM8PR04MB7283.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cKKS026S/zjrjyW9Pkm4EYhQwQyHZuhB8Afq317MFJVwWJODbnMtRS0uxW/alR9g5A5fIoiTsA8MhGSimqaiugGP+8kWL1TmjhnCfw1WVi2wxeh9cYM9R2wANHmgEHgwByHcSXbl+yjm5+W2Tvoi28Q1HKusANe/G/Wz0dsio7rH7OX1qI9VFatUjr/DfInMeZS5bY4dbsIWNSrbISDvcGYsr3RmYYs7J610+WTd8+c+RJ9XRTJljHXC1Cxf2rUKob5nFtDGtUa5ScWS5ubMkbS2Ctx7Oeb0toIO5Pd3gcTnIVJ0qDA0OVyOzHVXUdgkV8f+lJlLBpUXxn/vk2CUv/xiX2cZYJlK6MI9T6RgFCpmPmGc4EcZCXwzDZmkFpyrjPRC32roJXDUHdNljkbmCl+0sBwTqBgUCSvB69GxvI1gTCr2Lzjhu4+B1+O9HlMA/2FLgmegXenBk3/CGLL0WqPDIJgl8PGyzvReDPw2oMfimE6HvCkPBT3Gfoy1ftKfbdEF937XXI+u55nA94II3P4SSlBgDymR09DCHeTNAlggVCE2LFa1mIM6Hr4WkMlcH13Ln6746oqbWXGaZSwGQitShLRk1cBJeNfUYPbVKq5ue5QD0kZXmVGXUL3cDLwpPueoDTY+OdJfA3fczy5DdGqi2b5NmbiM0zK19wIxiyBwkO8WS/gbABhle8UyLla7nS5pbPKsHFF5oAqMv7b9aKqmc3mGgyufifFyFfK31Bt47PQ6Eb/GhhjVPGh4poBdsifpocoWV82p7BnqUrUrnjyrSMZg3lSOqPnsxOK/idATIHRuwHiz54Ec+wQumKjK
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39850400004)(376002)(136003)(346002)(396003)(66946007)(66476007)(66556008)(5660300002)(9686003)(966005)(52116002)(6916009)(55016002)(8676002)(6496006)(316002)(8936002)(2906002)(38350700002)(956004)(83380400001)(33716001)(26005)(478600001)(38100700002)(44832011)(9576002)(1076003)(86362001)(186003)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?c8GoPxUfMlnwH4FW2Xtggih+C3lOPq8jsZz6FmBaAYy+uk1qc27MEwdiqboY?=
 =?us-ascii?Q?rCjqNSQI4VOWUZwP6Acegl1FPkon8+X+/HKfR1u6q3eg41Mra05EXJCwgXOv?=
 =?us-ascii?Q?tPX+NewM7BfvUiG/y7+uCy48Vr9HT8c7kSnkR6siDeXwg7965QGbVvkV7krN?=
 =?us-ascii?Q?AenQdp7LXWiMR8BmRw5pLywvUJhT7XppJvA4VqFf/GVRBfZqLPOuKXwI50iy?=
 =?us-ascii?Q?AF3Zxqfp/aIVJ1MCYpbbIFr0CcSFnioQ3k6uH5fe3AxZoEwNi8e8dCAi3GTn?=
 =?us-ascii?Q?yJ558I/lnXfEZ8e0JPLMIGh3pDvTCpGhRVxHDaifkC4pwv/R7issy4W0Guno?=
 =?us-ascii?Q?ac0aUfoDoo/or48JSYSJOCxgblDrjdxXDywGykaabMqbZsy2bGiBnnpUvtJk?=
 =?us-ascii?Q?FW51bKrhg9QLuzcwI3rpYSuAEqoRCSKbSsxXknErJP9zOUUsMxtfR4PrkrgX?=
 =?us-ascii?Q?1cOEvGHLES9v7rmmNLGAbI/TcLciGP1vsblfk5sC66z+qN4nLs9/zCDw1Jyw?=
 =?us-ascii?Q?BuVNRpQiYEilUeBeG0digYicRxnpHImheuqhco9ldyAU9tymkHsCxRKhUDB6?=
 =?us-ascii?Q?WUhqW/A3ybU46BxSOti9wqMLd3BpyzGW44o0Z/zsiSQHTsYJ5nBQ73EE+FwA?=
 =?us-ascii?Q?XS+viFIacJz6u2skJsqAdF81qPTIonQ9D1+OMRcMLkOBwKQ3TpP7ck89opdS?=
 =?us-ascii?Q?hMnTQIxunRXtLU9JwhNOqHARmYGHTR7vmG2wEJ8AA+c58N48zzdpAeMdUShE?=
 =?us-ascii?Q?UQgAj6N+zMWPDarajTDYpwHuCMUMbRnKy43xfARuSbHLlY/RwIZznQGpcoik?=
 =?us-ascii?Q?6D6jOudR839ztN1Z/8mDyYKtf0+n2Vvc3uEjVdeHKSYyImoE+3TaOjuldcy/?=
 =?us-ascii?Q?OnuUMn5jly3EP0G1aOGC3xSnMn0PpN5udI+VCFgO3dAlQoIz/W+CLti6jF55?=
 =?us-ascii?Q?mLe52+zBC9zFvJFsQ3Vxe8GGcu6vzZtbxK6M/X4B4Vc8a+cY7zKoal7e6o9o?=
 =?us-ascii?Q?9Gm6lg0rf/2KiOSWOd4QLhR+x77TweyXajAEGuxmYRod4LzEtm+S9rbSKbqc?=
 =?us-ascii?Q?T5L81V4qjjyyBeW13IYNIU3U8UFhhIIASP+Yn1uFfS1ZuqdBxB8uRRZ967iW?=
 =?us-ascii?Q?VsdE7jtdKjZpETuXIWsUfcJlMhY9e/03EkhIgIIvIKdpQZpv9laO4578Hfau?=
 =?us-ascii?Q?dTf9qTZRSF4h+QoVo8ea3Yqe1p2MUuU2gyfaodR7+WtlY7Sm8rQXdF6OiGRr?=
 =?us-ascii?Q?snnN7/VhEEtGVinc7uI/Zt53hJ5+ZV8cQLWOk9E2Zhn5pQoCLrv0jf9TSuuJ?=
 =?us-ascii?Q?f5WzI4JiG4E6On40cdnXesf2?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 666a3520-e6d8-462d-d69a-08d96c571dd1
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 08:12:46.9100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YQhg/EcV4alzW8irD7GBDx5W0RiF5x4CGJ7/IH4qUTBy5Tq4XmSWI2TxamP9CdSD78o70d1/v+o2/4qs9wml/udQP6PjraDj8yRP+j+vBcG8NGOxRcahT9FzGT32ijaM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7283
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Michael,

On Mon, Aug 30, 2021 at 04:17:50PM +0200, Michael Opdenacker wrote:
> Without this, readers could think that "devpyshell" is a script,
> at least until they read the remainder of the section.
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

Reviewed-by: Quentin Schulz <foss@0leil.net>

Thanks!
Quentin

> ---
>  documentation/dev-manual/common-tasks.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> index f3b5084436..6df1f3b791 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -3476,7 +3476,7 @@ Similar to working within a development shell as described in the
>  previous section, you can also spawn and work within an interactive
>  Python development shell. When debugging certain commands or even when
>  just editing packages, ``devpyshell`` can be a useful tool. When you
> -invoke ``devpyshell``, all tasks up to and including
> +invoke the ``devpyshell`` task, all tasks up to and including
>  :ref:`ref-tasks-patch` are run for the
>  specified target. Then a new terminal is opened. Additionally, key
>  Python objects and code are available in the same way they are to
> -- 
> 2.25.1
> 

> 
> 
> 

