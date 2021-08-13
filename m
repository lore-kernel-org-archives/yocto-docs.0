Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.65])
 by mx.groups.io with SMTP id smtpd.web10.33950.1628843389065583328
 for <docs@lists.yoctoproject.org>;
 Fri, 13 Aug 2021 01:29:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=hk2Se5WF;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.22.65, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hquR2vrOV22eN7M3TaHpdm9HQg3CeJR0vhbFkYdLEky1XZWSbr5BJxXzuC8ZuxfKESNExeqGEKhe9eyKFQPvjRiKx95TNJ9Q4TpKVo4nHERWYvqodYXLtg2nimoLeftKu/G/cRBPpgelGu5lt8lrRCWcBA78HsUQUgeD4MaPLG2B1QABePtQ3WfMCQ63WZpy42yccRqyIK77pFyLBbCI53mpksn4yOdMRLNyegWLBB4WubVxd7S0s+tKGANHaN7yNEkG0uSdbPG+oP4PCS7Qb8pBxczsFm71lOWH03IcJ/sxU984r2BWP4ftDiZE/+8aXmBcxtSFo6yRSRbPE86iHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+UxE7d1AWxMsRE+hEzV7dLgS1vEFoWkTtu5u3GdkIE8=;
 b=iqskTEyJBSb1LSEHizYkilcnYp/fZ48DazCGIN+ky1hZspU0IRQlmjC8n6BkVUXxUiQPs9Bbhyb/iaJamsCxxuZ+FDs+bB/YgB6xtbTYcW+1q4iDa6brCWRLEypQDO0cn7VVXhome4DZCQf7B3QjkimT2RBUEYcFSTsGzczEEC80jiyqJxwiZHwAuidAOSe2t0kkYP/O0rHSDp1c9kdssL6WUBnIjkKmICtaTqf8SeEJuo4PlC9dHG970W3IB4QDv3qS+MdwXQj3Xo7gn/RTTPVvBDfHj4fQBB2bd8s2yWUD+Uv4s7YB7zzow1J48SLDMKMHj9CPlsDkEPfBAKLLXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+UxE7d1AWxMsRE+hEzV7dLgS1vEFoWkTtu5u3GdkIE8=;
 b=hk2Se5WFzUs8cJmmtd73sSkTVYPAeVHw1x9/qf0QzcKNLyo34KweufV+Ce99DOo60jCL4NL5GuHb6bA2dcDc+pvz6cmaMG5XbCvp610u5p1xKlBbVZ31iZzQ4f1mLNCtsI5fS6+qDHMOZZ3C7ggP9PypFBGUy58IDdB4g9nDBcA=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB6451.eurprd04.prod.outlook.com
 (2603:10a6:208:16c::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Fri, 13 Aug
 2021 08:29:46 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::cd35:af76:7542:4dd6]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::cd35:af76:7542:4dd6%7]) with mapi id 15.20.4415.019; Fri, 13 Aug 2021
 08:29:46 +0000
Date: Fri, 13 Aug 2021 10:29:43 +0200
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: Tom Rini <tom.rini@gmail.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 2/3] manuals: Rename the "Using .bbappend Files in Your Layer" section
Message-ID: <20210813082943.h66je2usb6o5r76i@fedora>
References: <20210812161027.580-1-trini@konsulko.com>
 <20210812161027.580-2-trini@konsulko.com>
In-Reply-To: <20210812161027.580-2-trini@konsulko.com>
X-ClientProxiedBy: PR0P264CA0266.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1::14) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by PR0P264CA0266.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14 via Frontend Transport; Fri, 13 Aug 2021 08:29:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8de0db9c-9b88-4b2a-3876-08d95e3481d1
X-MS-TrafficTypeDiagnostic: AM0PR04MB6451:
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB64518F02B4A8ADF943C65E91C2FA9@AM0PR04MB6451.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xBfk+qJqR4JA5/fh8NoGRMZ+vIzMo2SKNn8BMp7K8vkgoYGR9cMtaq0y4l4P5By99ydgAGXEY0gIaASP+ihW5dPQwl6h4v+q8QOF05/tvVv7TzhH962d8uuiZ5ee8CM7ePILMK+IV42mEc03tAaFoh3wtfUTJJ9E7tLoQHu75uM4kFDNLCD71e+VP2jOPWFsRAYwbmnq0mYtUZHcaGip4SFpPVC/dCO3iPOUDrnNESpZYQhf6roVsLV4dh0ZWiwPyOhrziCkR7J/GIcQxencZcIJXnvKUd7OnRdrYteXv0ATGow6yHhgf7y/EGbTEUNQZj+pWm0uD9lKLMPxNZOuX+s5xP2ZxIa1jnHlKXSxSZjvaQauugCPrLpzLI6en/KQVpdo/ElEuh5ZlQsqrKW78ufpopQRdsHQjglA0z8hdlCC6aHYCDhvuSapXD1dyVS33smacKNMkmeaG0iB/3wwXZJCxjOmuXNlRluh/usVXBbqG5/J8hisP4Hf+wdV16MwtkgbavPmNwqGiuyhZ3o9yaWZGxe9cMzyvh/gL6gpop5mEoH2fY503SUXL5jZMDIFS928zVg0U2jwC3exHUb3pA+RBxjXyFfPquRbCYuEY4eEOJ0mNlyR7oSsddzpU93LwrG7HTz1mjyHd4YV/GIoBjcwm0gRObqn/cdWLnn2/gXI3euJK9g6i86eTz1C06UwZG3lphMhQI9w/2rYCX55AIUOUTRqDUr/H78fqOgZ+Lg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(396003)(346002)(39840400004)(366004)(9576002)(956004)(6496006)(44832011)(66556008)(66476007)(52116002)(38100700002)(38350700002)(1076003)(66946007)(5660300002)(86362001)(83380400001)(26005)(2906002)(478600001)(6916009)(8936002)(186003)(9686003)(4326008)(55016002)(316002)(33716001)(8676002)(142923001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oz52iHwsQ2RVzbk+czEWnjf0//eCcXrR7q1/DJ9hifaocZiotEHfUtDGDd6d?=
 =?us-ascii?Q?0Yy2EP/BUMB5jX8fgzGz0f+9MgGKoRY5w5f2lyTKY5X26eRc7TLNBAPLOtou?=
 =?us-ascii?Q?6hqMeJQdM/XaJqK4k2JbVOcrKy3qJf8u+sUT7nBTJvLO07ELyd2sIVZKPcIc?=
 =?us-ascii?Q?U2o4zbPx0wDGjdncqDJ1/kk77m9sD+TAJ2x6MKXetYzZWCXOv0sbwhvyY6l2?=
 =?us-ascii?Q?YVbxmnRTuc+RQvhKcqqw5CEw2p0EwU9XtLE3+ghhPbTsj0umG3IxxATJv8i2?=
 =?us-ascii?Q?3AVgYh77yjv/8p217xqsF6/iRTAe5Z4qZVFkNSDkTNJen4O1YSVxVGEFWjyA?=
 =?us-ascii?Q?fRByEEewimvZ5Dz1Ym4XBrbOYfnvCYfG2ERc1NaBtw81zX2YRfH/9CG7YOq4?=
 =?us-ascii?Q?BuwLJTgKdLfd1YrwDD5znmE3VfRT1NmlGK0d4C9VsW/0p+G2OjmvcN9Ve3NE?=
 =?us-ascii?Q?P3PzdPKZLyX6z33DMvb1F0RuCki3gc0PM7QgSPBNrlbnHBSRIFxbm1ICEZ3p?=
 =?us-ascii?Q?7t/kEuzR9OXmtcgTEUINIUz/ikG3WXa9sYmYHyCRP3+yi2cMGvKnFijLP/2W?=
 =?us-ascii?Q?xmdllwapqy+1FmDAnhbPXrqgN1693svuwn+o+j6iG3is2nUw9Oc+0R5VDgmn?=
 =?us-ascii?Q?BtOt427xinV7oQwhwBfRsSS+rIfJ4QZP5fyZXJJWHLlWVOX0U2VpxSjurE4j?=
 =?us-ascii?Q?EoYuE9n1u/x6iK3FDpV9tX3txlbJ0ulLn7FL9uMAEmoaTUYoSiNzdr+kWOWs?=
 =?us-ascii?Q?8LEwzxyVS7GUCo5nKVr6Sbrp9RNCIFnL6KyMxMHLWBj+g9pwBc4VgNLtsQpJ?=
 =?us-ascii?Q?i4F6ooqS6NUErikEVeefXttbG1YTx+js8UpzzeYM14soIC1p5mWTaCBds9hO?=
 =?us-ascii?Q?xFZlVmwuS+jH4S1GE7IVaKY1lkqlVJPx+w1ECYZ5IUZR46kp7/772l2Apl4f?=
 =?us-ascii?Q?Tk7263Y43Htw7ivgt28e+/BipYpiRVJpAvZ3ubrcf6NtXrXIXmkULDokCRTQ?=
 =?us-ascii?Q?eqgfyj320atV8Wcm5YaTpdKEbrVh4nxdtUjc8CpMqI6yMsIVfePTvFhqmC5S?=
 =?us-ascii?Q?xiF8+vB83zh+dFBD5JX2Koe1sEueoBYqj19mVJY4sBGdxxHXZQJdqiep8xX0?=
 =?us-ascii?Q?IG0fkavJI6kV0oKwu77gYl+FTE2kAdxGxTKDZ/Ul+0TyCeCnWfXJpA62rrAJ?=
 =?us-ascii?Q?D8MePI9XuqKrA78eewzwKzPGCr9uXgM+wh0giElKRtwUxj1Csmw7/WxRDVS7?=
 =?us-ascii?Q?072bRsL88yVYOWlwHwMdnTU8r47Sd07S/Uz9YdmWriwyL2FXQs0i0/PabKGY?=
 =?us-ascii?Q?kVM7rsoPlX04kXEA/1n4tBe6?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8de0db9c-9b88-4b2a-3876-08d95e3481d1
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 08:29:45.9708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uLII+2UsekHXMDhmQRO9C9G1peK6PxNyuuRX2yu12iOBMo0+ZtQ4+qPwQNVLxSuuadz1cMrrAkXRnqey6568XMpX6B9PUoACwTtn2Zbwhb3zIQdm9l1PfBEtgXLBLtNJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6451
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tom,

On Thu, Aug 12, 2021 at 12:10:26PM -0400, Tom Rini wrote:
> .bbappend Files in Your Layer" section to "Appending Other Layers With
> Your Layer".  Name the current example as "Overlaying a File Using Your
> Layer".
> 
> Signed-off-by: Tom Rini <trini@konsulko.com>
> ---
>  documentation/dev-manual/common-tasks.rst        | 9 ++++++---
>  documentation/kernel-dev/common.rst              | 4 ++--
>  documentation/kernel-dev/faq.rst                 | 2 +-
>  documentation/migration-guides/migration-1.4.rst | 2 +-
>  4 files changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> index 2d8ef96e2600..f15e72887c04 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -443,8 +443,8 @@ file. During the processing of each ``conf/layer.conf`` file, BitBake
>  adds the recipes, classes and configurations contained within the
>  particular layer to the source directory.
>  
> -Using .bbappend Files in Your Layer
> ------------------------------------
> +Appending Other Layers With Your Layer
> +--------------------------------------
>  

I could suggest:

Appending Other Layers Metadata With Your Layer

But I think it's fine either way.

Reviewed-by: Quentin Schulz <foss@0leil.net>

Thanks,
Quentin
