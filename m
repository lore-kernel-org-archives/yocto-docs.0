Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.61])
 by mx.groups.io with SMTP id smtpd.web09.3629.1628250079044135405
 for <docs@lists.yoctoproject.org>;
 Fri, 06 Aug 2021 04:41:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=GTU6pb4L;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.22.61, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gjHTzZ01q/+mT0ohDFDG/Y8AvPab7z8JDljpAWJrXY65iJeJmQ6HvYe0SBnPXPyO7AFpw/mg8OHG/kZ9258MgZxVMsOjRmVLIlzgYE2MAo1vGsH/qtcAe/a9nE5lgwNMgmSRpU2cw1mv0OKWDtSJZJg7UtSObAKH2EEov4YH4wDCi2caxc14+2D7sawY/C0Fx3cWbAN2DD/hdcv5Px4z0EmxBtmWL5PJZXO+U/RhiH0c2PcFad2gtJ6f1gjrWaJduq4Z0j8Yli2/rP5TJjCIHnIL6F4KZVHtSidOOG2gAy0sXDuYyyGHrTcGBZkzEttREPdZeSy03WDEIvkwN1JB/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tXr1p5p6O4+gfNXd5dabqYXCMWDHUV/hPDBK3bfftl8=;
 b=ZyKfbEepaxi2JW8qu+EQtgLOrBTXEPsxLlxoz10aHOP8QVKhGwOvA/p25SbCRUoWy84++Ojywbb9wyPSM8BzP0y0p2W2lyp/IKh+/whiatStz1HiTR66UaoYOJ/QeNRPDhNwTeCKsDALRhLC8vA0zJD+n3In7mbSawOZllaibRlSBVc98A+FDAIvxk9/Nt8RwCxRBoT42eZB59AMsSHGX+b43O2TwRq1MXACpuqKdO9nw4X0pvYxpvaojepIkbK4q6A1pAWZiuVCGAbToSRyi0o2WHjC76u+2ibdcn5OzxJK2GFU47Soo9DaYCFP8gN+JpKw1a2MeEW6dSlDCyS+tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tXr1p5p6O4+gfNXd5dabqYXCMWDHUV/hPDBK3bfftl8=;
 b=GTU6pb4LSRMe7FAQ1Gaw4Cd6J2at3vVqJkOFsJHie4FVtwb6Wh/C9b/QCjYIx7aoFUB5NTbIzKnK2WFz/eSr7+mmBJRplYDsS0FZnm8arQB93VY6+U9Dh6N+cJJ2UyPU18AIDviEavhiez8XskERkMcZUQ+MGmhh38GtEX7qVGg=
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB5939.eurprd04.prod.outlook.com
 (2603:10a6:208:111::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Fri, 6 Aug
 2021 11:41:16 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::459d:3240:1c4e:b920]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::459d:3240:1c4e:b920%6]) with mapi id 15.20.4394.016; Fri, 6 Aug 2021
 11:41:15 +0000
Date: Fri, 6 Aug 2021 13:41:13 +0200
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] manuals: further documentation for cve-check
Message-ID: <20210806114113.4453gl435gtde7xy@fedora>
References: <20210806103720.50047-1-michael.opdenacker@bootlin.com>
In-Reply-To: <20210806103720.50047-1-michael.opdenacker@bootlin.com>
X-ClientProxiedBy: PR0P264CA0128.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::20) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by PR0P264CA0128.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1a::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend Transport; Fri, 6 Aug 2021 11:41:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81b3cbec-0b1c-4359-f0c1-08d958cf195d
X-MS-TrafficTypeDiagnostic: AM0PR04MB5939:
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB5939C8E1602E19DE68DCAA58C2F39@AM0PR04MB5939.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AFMi1tRIQimC+l8r9BleW7TvG1msgE9j37HbEiWv0aLLdJO1zH3V7s4wNPMLedFahjjrr9VBnOUC6+87vm8SSJAz1i6BvGUe3rJI688yV8qcAdCzyJtmta0+6/m7TxdgaJAeMhGYJqnsF/h/eGjuo7jGea31TLy2jYvaYN+CPU5VUg3tWU0LmWAZtj5FEB9atBlUAnN1LJjnGnSLUdwd9sm/wos8g3afdN0PCmbv+5wUSiUFJ8LcCPRXMH1u/2z5pWPan0l9eI/Acu8TgtNNLF3tgd1vrQf4hxCbkiGKbfHwnWdNyc2qs/UPv/zWfXzxs5p7exKWcoLa5vfu83RJdlJ4TTinkhEAqUrAYN/uiTP+ya43h/nqsoa20kiK2oGPmgYawxTPT3nzb9eklrPQ+3PTDHx5bs+PhBW4O1a8QNJtJoMsr0hh4AKXxb8xvTkse3NvOWiY5LovU+ViKaF0ld8SFswiGiC5zVvh/cu2Cfm6o3nwIztsyXE5Ygzoknl6rG27gHT2UxsYwWogWXw0q0U526HeM4zZWR1XGfDbhCo9Uye8YulZtTdYBXf2DldYrI2ze+1mE8WUGdOYEAmqSuYNeEnyI8t+9k3GQ/yzfubvFKq9TR3r0vPFZdhkt4Aju91we4IoK8NTiNxlc9zSgs56GUnZrkjQZsg0XefUMpk5ecX8/oTs0wQcncX+d3yHnA5pGql4b0hygc2oOJ7JWTDsj6Lb4T/PZAGTYsqMEW5mwexHJDeo7Zgjn0rBRuHdo8Kt7bSN93i9YVu3tDzP2w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(39840400004)(376002)(366004)(136003)(396003)(83380400001)(52116002)(4326008)(9576002)(2906002)(66946007)(86362001)(44832011)(55016002)(38350700002)(6916009)(1076003)(8936002)(478600001)(38100700002)(956004)(8676002)(316002)(26005)(186003)(6496006)(5660300002)(66476007)(33716001)(66556008)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MIgov8wbiccFY1s+Vlpm2lvJ9sgAVAXa2NELDKUrOtGbsejss2tg5/+/JWTo?=
 =?us-ascii?Q?MbgS8Bnf3a1YG4lI9RnQYGmPNaOjVoRRQzCIkZMM+BIc9Fpyg0Q63s/KkArL?=
 =?us-ascii?Q?LYLTVrtdZj0jjWJEIM4BMbDTFdO23xxPTUuzBZnL3xSbiCGzaK4D+A1LlQu/?=
 =?us-ascii?Q?D4Um7Pn3GT8CXLxyIGwb3ISuv42N59fvgBIH/fGLOxvvqKTo3LkKPGK87JQt?=
 =?us-ascii?Q?i40iWtSe0mA2hurwAa6ay8ZRGU0eT5ioGVTeI/4uyOPpmBu1/dtRLih7zS+D?=
 =?us-ascii?Q?SJf1TELFQVPb+oi7zp5AlpIJXSpmcWMLihuMbrKGrRusbrPn6zI9DWseP1/6?=
 =?us-ascii?Q?pg70O7hKl9gUzUooM7/ZrcAgoMxNE+He/xvkz1GqCnb3Xu0phcewUgAQHEMR?=
 =?us-ascii?Q?SKv/da3JYe0jwn21EKL8Vehqn6T+xVHxZdKpD+/h8GVfug7WhYQn0c71dYQU?=
 =?us-ascii?Q?Ig9VMxu8kOdeYDxq9Hxy191Lg46y3S6QZhzVnqhl+KGQeC/fnL80JhOGVPpW?=
 =?us-ascii?Q?8pct5XgH1oVgGVi6u1QeoWiERStQeshTIDmytzbcWGNKy9ZKq2yOY63qGMq9?=
 =?us-ascii?Q?SLszIsGOh+y6fu+34XUuUEguQmP3BKZRB6DgIKUCBV4TiNY5hkFhV/7omO13?=
 =?us-ascii?Q?eoKdEf0BtdMeYRxtNMEx50iNmn1xIhQk809iOlvEIdYlol+YDnzzZrO0rnsF?=
 =?us-ascii?Q?1VA4qr22hgLnOadsXR6ahANaEptaMla8BeV66DftRU6JQwAPGFP5tYmSo1wA?=
 =?us-ascii?Q?uNZAK5w2/guvWGePl4Hswa1JXVD3Mji1cYEqamil0O11q125FydTayd+wtyh?=
 =?us-ascii?Q?lkxq2tKuikrGC/+FpXjx9PLd2bbKM3wDFOpp0z3+jUdWZxxCWOZ3OhyZUYWn?=
 =?us-ascii?Q?GA2MiyU7F2j20BAf8MN99/ZhfFKCGpFoO96aE9jcd9jiNfHa4X5q4w2HDMDF?=
 =?us-ascii?Q?zZvoTET7Lsv2aOVeOmo+xKU+Ep5X/vLuYIUTmji66PCUfO+9vb+2zdGL1dKl?=
 =?us-ascii?Q?8RnZ4M+t5xfrteGk+GwmbFz4/lRyFv8ne79lprBt0A1ZcqfmEx5aik5GTHAH?=
 =?us-ascii?Q?wrfsQYzLmRc9RTY47qszdmT35Jl4/7KJuuuXoUtCkqOav+ulCC3m2eK1FJZV?=
 =?us-ascii?Q?nFjM7WtGo5JMFj07Joqniy0ZnOQ6E8mg2NqieF2Hqj3NSHrn1TNgXYLFb+9i?=
 =?us-ascii?Q?XVaTNCAL4+QAcu2KgUmhJJocF4wBncBb6QKwBdxLXFxWKTN5ZIx6JG7Stim6?=
 =?us-ascii?Q?8FZMQMb7ANFACT9OBjTOZFih8d/9olGhp1/9k2pcm1ut7oEbHXNRytqb1jcn?=
 =?us-ascii?Q?lISJ6YewFESGwP8rOFHo3UP8?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81b3cbec-0b1c-4359-f0c1-08d958cf195d
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 11:41:15.7445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UcMuDHIIBZxrZmwAW2bhXCig9qOlkK7nv+Bi2RgIT0Z7Eou50FVNo4RykbwW1zUUS28ebGGUc9qrdAoAC1C8pFKdnSoAmYsexsocwhAyl3HFhD3i4E3g7c1r5rpyk8+x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5939
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Michael,

On Fri, Aug 06, 2021 at 12:37:20PM +0200, Michael Opdenacker wrote:
> This adds details about the actual implementation
> of vulnerability checks, about how to fix or ignore
> vulnerabilities in recipes, and documents the
> CVE_CHECK_PN_WHITELIST and CVE_CHECK_WHITELIST variables.
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  documentation/dev-manual/common-tasks.rst | 67 +++++++++++++++++++++++
>  documentation/ref-manual/variables.rst    | 13 ++++-
>  2 files changed, 79 insertions(+), 1 deletion(-)
> 
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> index 7fa0df4d39..a7eb4642de 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -11131,6 +11131,73 @@ Enabling vulnerabily tracking in recipes
>  The :term:`CVE_PRODUCT` variable defines the name used to match the recipe name
>  against the name in the upstream `NIST CVE database <https://urldefense.proofpoint.com/v2/url?u=https-3A__nvd.nist.gov_&d=DwIDAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=9ML--ZrDALJnWP-cdKUdSr7aZojrZSP_ZftKiDw8b90&s=X75uMn2Jgp5D1ZeIRtUVm_E0hUPd6JAN5YALxFwNawI&e= >`__.
>  
> +Editing recipes to fix vulnerabilities
> +--------------------------------------
> +
> +To fix a given known vulnerability, you need to add a patch file to your recipe. Here's
> +an example from the :oe_layerindex:`ffmpeg recipe</layerindex/recipe/47350>`::
> +
> +   SRC_URI = "https://urldefense.proofpoint.com/v2/url?u=https-3A__www.ffmpeg.org_releases_-24-257BBP-257D.tar.xz&d=DwIDAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=9ML--ZrDALJnWP-cdKUdSr7aZojrZSP_ZftKiDw8b90&s=jlaowuJQXhq1Lp2jXZTs3bYLiFspslcuyaTiPLrhe-o&e=  \
> +              file://0001-libavutil-include-assembly-with-full-path-from-sourc.patch \
> +              file://fix-CVE-2020-20446.patch \
> +              file://fix-CVE-2020-20453.patch \
> +              file://fix-CVE-2020-22015.patch \
> +              file://fix-CVE-2020-22021.patch \
> +              file://fix-CVE-2020-22033-CVE-2020-22019.patch \
> +              file://fix-CVE-2021-33815.patch \
> +
> +``cve-check.bbclass`` defines two ways of supplying a patch for a given CVE. The first

I think we could afford saying a few words about this class in the
Reference Manual? In which case:
s/``cve-check.bbclass``/:ref:`cve-check.bbclass <ref-classes-cve-check>`/ ?

> +way is to use a patch file name that matches the below pattern::
> +

Not sure about that one but s/file name/filename/ ? If chosen, fix the
other occurences at the same time :)

> +   cve_file_name_match = re.compile(".*([Cc][Vv][Ee]\-\d{4}\-\d+)")
> +
> +As shown in the example above, multiple CVE IDs can appear in a patch file name,
> +but the ``cve-check.bbclass`` code will only consider the last CVE ID in the
> +file name as patched.
> +
> +The second way to recognize a patched CVE ID is when a line matching the
> +below pattern is found in any patch file provided by the recipe::
> +
> +  cve_match = re.compile("CVE:( CVE\-\d{4}\-\d+)+")
> +
> +This allows a single patch file to address multiple CVE IDs at the same time.
> +
> +Of course, another way to fix vulnerabilities is to upgrade to a version
> +of the package which is not impacted, typically a more recent one.
> +The NIST database knows which versions are vulnerable and which ones
> +are not.
> +
> +Last but not least, you can choose to ignore vulnerabilities through
> +the :term:`CVE_CHECK_PN_WHITELIST` and :term:`CVE_CHECK_WHITELIST`
> +variables.
> +
> +Implementation details
> +----------------------
> +
> +Here's what ``cve-check.bbclass`` does to find unpatched CVE IDs.
> +

Would need the :ref: link here too if chosen.

> +First the code goes through each patch file provided by a recipe. If a valid CVE ID
> +is found in the name of the file, the corresponding CVE is considered as patched.
> +Don't forget that if multiple CVE IDs are found in the file name, only the last
> +one is considered. Then, the code looks for ``CVE: CVE-ID`` lines in the patch
> +file. The found CVE IDs are also considered as patched.
> +
> +Then, the code looks-up all the CVE IDs in the NIST database for all the

s/looks-up all the CVE IDs/looks all the CVE IDs up/ ?

> +products defined in :term:`CVE_PRODUCT`. Then, for each found CVE:
> +
> + - If the package name (:term:`PN`) is part of
> +   :term:`CVE_CHECK_PN_WHITELIST`, it is considered as patched.
> +
> + - If the CVE ID is part of :term:`CVE_CHECK_WHITELIST`, it is
> +   considered as patched too.
> +
> + - If the CVE ID is part of the patched CVEs for the recipe, it is
> +   already considered as patched.
> +
> + - Otherwise, the code checks whether the recipe version (:term:`PV`)
> +   is within the range of versions impacted by the CVE. If so, the CVE
> +   is considered as unpatched.
> +
>  The CVE database is stored in :term:`DL_DIR` and can be inspected using
>  ``sqlite3`` command as follows::
>  
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 1150940133..cc7be01fc5 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -1471,11 +1471,22 @@ system and gives an overview of their function and contents.
>           variable only in certain contexts (e.g. when building for kernel
>           and kernel module recipes).
>  
> +   :term:`CVE_CHECK_PN_WHITELIST`
> +      The list of package names (:term:`PN`) for which
> +      CVE vulnerabilities are ignored.
> +

Since CVE stands for "Common Vulnerabilities and Exposures", isn't
adding vulnerabilities redundant?

> +   :term:`CVE_CHECK_WHITELIST`
> +      The list of vulnerability CVE IDs which are ignored. Here is

Ditto.

Thanks for the patch :)
Quentin
