Received: from EUR03-AM5-obe.outbound.protection.outlook.com (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.59])
 by mx.groups.io with SMTP id smtpd.web08.6511.1628264329834153525
 for <docs@lists.yoctoproject.org>;
 Fri, 06 Aug 2021 08:38:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=EB6llEI6;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.3.59, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HK8MPHtSmtiV37gZU/dSZH/BasowSM7Ge8gFgNf/AaugfO8s6YqhGDyr2/S8POaNNeVm4rTyfDUXkX8PlmXR51mWk9aPea2AsnHSfgk2nFqJGLd//sZ8mC6G409oITV+HKqscKYzS/Ie/t8b76+7UEEX/MIjC9c2+O+JYNWvlkN7CVSGxu7wpyzgj0WZwnaD7jTrVJ4BwBRdDgQCfvT8gf7HzkUVz1YBlYAeJMtbdTR/QK/5jnFJQl3cT/jfNpSeuWpipySSgg/EDh9FbMqv3Rfn0m6JTxmn12J88rbnri7iO+5vtpcfkhrSLMc/5CdYE5g7sJ3xtaTeu///QRYDBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vIL0EMLXcf2EK46ZFRSz23hkE5CpkO38X7A6BnFEuuU=;
 b=mdWQBUYbVyTSrB1dUfk/QBoEjgqxVnUOE7lUd4BeeSgqx75qM0l/lvBKy2Cxoa68ayr71sbo1Lkj1IdvfUmC0qq0xryTWxAOhw4TpFOXnpIU9IL76cIFAL7B9ZvB8+WM6MMgSWlxrP6Tq/zrjCPGRI8Akvm5V2Oi/CvmUzVkRBew2zfkFjSKOO3Zvs546Epp0ekwgaFqcaamJYskLnTQRB8sxNMYzAYKHlTWhwUdi23qQMWKWwn1EfSXqTqWGPyJdtwo+Z/qAAvZY+I01NMtyX4k9U5TR89KpWBBr7G1DZyEWTRJiIQ0ksGEscXGCeQyWstfXcWFXw/h5MNl4jQanA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vIL0EMLXcf2EK46ZFRSz23hkE5CpkO38X7A6BnFEuuU=;
 b=EB6llEI6/EvFCUFCcYNlEkajUmikJPHPnDj4nn0zWgqvzbR9YnEtfyZDvO+87BQmfqKmrINNVnckHZ886ulo9onzCOAkRg+rB1z14S1RklNgP53oMGZoROfYMQ0CM2Gr/vkDCZlyS3OyTraHxbaLLCMVDLch0q15q3Cv0z7Pk54=
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM9PR04MB8099.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b6::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16; Fri, 6 Aug
 2021 15:38:47 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::459d:3240:1c4e:b920]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::459d:3240:1c4e:b920%6]) with mapi id 15.20.4394.016; Fri, 6 Aug 2021
 15:38:47 +0000
Date: Fri, 6 Aug 2021 17:38:44 +0200
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v2] manuals: further documentation for cve-check
Message-ID: <20210806153844.3cnrvphjnpddp55w@fedora>
References: <1698BF9C32F2ACEF.15765@lists.yoctoproject.org>
 <20210806153447.59835-1-michael.opdenacker@bootlin.com>
In-Reply-To: <20210806153447.59835-1-michael.opdenacker@bootlin.com>
X-ClientProxiedBy: PR2PR09CA0022.eurprd09.prod.outlook.com
 (2603:10a6:101:16::34) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by PR2PR09CA0022.eurprd09.prod.outlook.com (2603:10a6:101:16::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17 via Frontend Transport; Fri, 6 Aug 2021 15:38:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 94690f51-4129-46dc-b2fe-08d958f047bd
X-MS-TrafficTypeDiagnostic: AM9PR04MB8099:
X-Microsoft-Antispam-PRVS: 
	<AM9PR04MB80995911D032B704E633E033C2F39@AM9PR04MB8099.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xi/JKUJ4tYF43VBLzvuy6oaj5O1lpiJ9pR8qvKYUqJe4oFAWk363DSf51EuL0rqkjvfp2IAetmFHyrw0fl+UH59G7M3fDGBJoFiuwM4grhTiBLNmeDHMwxtf4yvbY2I8T48Ad2K2G8UAazmfhlfQLOccSxxeW9MJopwTBcxMsbe1eP4K3TQSFb3dvPuIzGErvgaKxwz+udQjQx+XOA7wiK2bDFaJBdZ0pRq0XELpSp+LvnX/1tKAnFE20+ZygZMg5WsPNG4lQrBw2q4oQZkp624jqmXRM7/c291zlEcFipOLJSaZnbCenZLQQ8HgJXjRKgWQ5KeX8BuM16xfrQU0eq1D4PDxesuU9kYCUUNbWxrIPzFdDdm8HVwTndWHAYesMFkkj6YMO8jBRigFpQWJvcsKt4+ZyHt69P1GB/TGhiV6Iu/d7Pa4COaO5KS4Ql0Tb4WKvwK2o6Kjm2UUi+OtpzaX49RgWvQmKTMTnp0SaXsPlHDtb4a13XpHXAifnDj1BOtFFbMRqFkwg0dD+GcVgHnNBW5BbyrCrzRx/LlRTH4xn6HLEsGmuGcGuq7/X5WSm4zNZHmT97hYp318e4cLP1hNdRsWFH5EcsCLaeAE0rBBt/Kcz0IGTSZEOD3wHsKLcKeHS8V4vFThx/ATJJrHqtc+xh+tOjSzxA0EM2BD8V27aTPu3z3YCs0YmJt8UyBN4SzCMsbIIm/hVEKU+eodCA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39830400003)(346002)(376002)(136003)(366004)(396003)(8676002)(5660300002)(66476007)(9576002)(44832011)(316002)(6916009)(86362001)(478600001)(4326008)(26005)(8936002)(186003)(1076003)(9686003)(52116002)(38100700002)(6496006)(66946007)(55016002)(66556008)(2906002)(38350700002)(956004)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bnhbJObTTwEbi6ReSV+1GAc+SD/RlqJjOrLoLtreuf4zalviXKFeAYnzEMtd?=
 =?us-ascii?Q?8tl7oAiMe/N/UEpMRwpv0BYD3tsoYNt4Kf6vaMJ5H5/SUqtls3XXrtRrvHGh?=
 =?us-ascii?Q?zMDyrwQ2PIC6H7G2ixSFoIhjALqpERYhdEW4I0lF/1bdFHn9hz05o1olQc+c?=
 =?us-ascii?Q?a+664AYgs4q0zk8yhMYtbVec3dpVCPAtM4adb58Sw0hL3axj4fY9JQklo40k?=
 =?us-ascii?Q?eGcfKeouts8nv+HAI+FA8Bz05ba4kbs8U6YXyiNX6mXAgBJ4/z/ZqozKL5BL?=
 =?us-ascii?Q?uywQCfUuJN+r7++XjI9ZL8V3dBCY4xIOCKt2bePZSX7EfQPJ8R4UHukACajN?=
 =?us-ascii?Q?/crS8zkOMT9E3gA3EzmDggjMIfJuaVS6aV8RldJ7CTl+F/bpEO2G/e1L1Hgl?=
 =?us-ascii?Q?Wh9Vp3g9PxWzkHHP8pAR7ITjS1gmyJYfOa02/dyJzThUwu1sVFxCfsDFLQuu?=
 =?us-ascii?Q?zGM3rMyaFRY6xuuTj40nsA6oFtpMJOivaXpNcFJfn5rtXa4Zz7Sh10T7M+AV?=
 =?us-ascii?Q?jWXXZYkFHj2OqDhkPoTpDLn3oJCzng9XSVisGfFBDHFpSoBDmk47ixoMHV2f?=
 =?us-ascii?Q?Smdi0/MJrcce3HdZMAWfALFFdctpZVbPGic1vXUWAfJe4TuWJWMvC16LJ9vC?=
 =?us-ascii?Q?IozzmTZTqS4GobTOvNHd7GQZzZdlMTkbZERAklmIJKteyyRapE2wS/FxuPB6?=
 =?us-ascii?Q?l6wlRGA+qOro9kbiNCEvljkBOeH+A2+rK6S4gag38xBwUUj1+P7MqJP7WZUX?=
 =?us-ascii?Q?au3TtmIvbfjJiSgv6bfiHg8mgNAqJ1wFJ/CfEWQa3xAo2/fwrWxPT028OK8n?=
 =?us-ascii?Q?qxG1VvhWtar45DeATahQ+f+sYmGdrn9V8bhm84o5Dk3+UJA8ol8saNuCmLs8?=
 =?us-ascii?Q?A5thejCZhn6dm+5lCioqabo3cbyCf84Mjhlyf6vivIe+uXWIiasMXqG55Ija?=
 =?us-ascii?Q?799ui3+MjE3jzIJrX8/rpOgIVH6DGVMFa7YislO2I1hLl9V3vlIHRVVLZCLi?=
 =?us-ascii?Q?K7YUst5TOjxAdWepqdlgDwCkLOUn68NSz3FOp/KYSyYN0gyro3oCVXecW4wJ?=
 =?us-ascii?Q?b1weB6W/vytHphyqOseARSbJbWCxCm2CjEhzHfp1B8c2DyHv5NidUiV8O3E9?=
 =?us-ascii?Q?rjTZchm2egX+7l5DvptK+8AByQTBd+lEiGRLkIzDT68DgRqF0DNsyBV31LO+?=
 =?us-ascii?Q?b4STLI0HL+2tglY2u93tGleMbHmHp0N33yMSBYKDW/503JZO/pu8ZWWDgoX6?=
 =?us-ascii?Q?qdwkMOUjC+huft+eW6hbU2v4UNhcL27/y+0jlKf+xHMRTTQ/SM45v2dHgk6O?=
 =?us-ascii?Q?3Detet+2krgrUpYSpDbKdp7y?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94690f51-4129-46dc-b2fe-08d958f047bd
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 15:38:46.9708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NOv0lPfZ5jEkGBy/iQbYAk03a8IJ/OVddK4VFs4D/50278DTfWkBFpNh5EB7eYIo+4X2Y/K/PSQR0yNJafpftlKmta7gVEOy6bMHvTYLEeu1vLXl7cMQ76yJNbejrUGf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8099
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Michael,

On Fri, Aug 06, 2021 at 05:34:47PM +0200, Michael Opdenacker wrote:
> This adds details about the actual implementation
> of vulnerability checks, about how to fix or ignore
> vulnerabilities in recipes, and documents the
> CVE_CHECK_PN_WHITELIST and CVE_CHECK_WHITELIST variables.
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
[...]
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index 49905f2725..274ea19e6e 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -404,6 +404,18 @@ cross-compilation tools used for building SDKs. See the
>  section in the Yocto Project Overview and Concepts Manual for more
>  discussion on these cross-compilation tools.
>  
> +.. _ref-classes-cve-check:
> +
> +``cve-check.bbclass``
> +=====================
> +
> +The ``cve-check`` class looks for known CVE (Common Vulnerabilities
> +and Exposures) while building an image. You can also look for
> +vulnerabilities in specific packages by passing ``-c cve_check``
> +to BitBake. You will find details in the
> +":ref:`dev-manual/common-tasks:checking for vulnerabilities`"
> +section in the Development Tasks Manual.
> +

I would maybe add that this class should be inherited globally from a
configuration file with INHERIT += "cve-check" just to highlight it's
not expected to inherit it in recipe files.

In any case:
Reviewed-by: Quentin Schulz <foss@0leil.net>

Thanks!
Quentin
