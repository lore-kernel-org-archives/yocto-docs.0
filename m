Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.83])
 by mx.groups.io with SMTP id smtpd.web09.21114.1627916887007541565
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Aug 2021 08:08:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=oNih+S//;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.8.83, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VF8hRr6DnJvmwT0FLBGcm8A+t+FMUIglFrJqjeZl405NnbnQctZl0soE1yVKrtCbfkh+LlEGbMIzTz+LIFrnqb+Lnwslh5QtcOnYpZNGlVFUXn1endoH0GLkTMznHf8zNryTmVH5I7E6rZLIm7ztd3ALcFlspSA4IBb5oQifgfKFMoWBaQf3aZXlyrejbY+vrDMXrUwTuYdMC/dg6k9v6mb3vr5++LYieLwcWszCsae3yL1umJPDmroNWybA3n5ruLv5DfH6iT3hdZB45LUgFiPjAqpAgOFsCkxJIDIdtk1L4KP+evzF/phrno4P2CESh1wOGRIJxDPvVR48Kh12pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=clqwSVPvR44hLoxilT33+H4DMVxJwOIvx8st+GOiy9g=;
 b=K2ZWIzPcKnup+garnmE2Snf2W+z0FqfBPmXBzoHDVw7mSzcTKXCbt2ozLFvrHPylO/2kHlvKt2yqBi87IHfwIH45ohDWRLl55sfi4ZIhwiItQVMJJNU1doLVty8IfJpjwIawZc4B2R0WaRBvWNc/ZsVTzR/Paz6p/F9MAlJrjQ4PQKNUugjbpoLdCYpQnlv8wFKg8WRIb5YQJ+8Y1sGNwbSuvcub0YcHS8AvgqSIqgFDTjf3Qox3euksoT13XUCMCov2Drq2Y4afhrgsCtHQG/My/0I3+ETvVv4J7QJJHwOHZpxn55HZSKBsfSMYsDYVhSOemWdmDMVfBvyZmiLWXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=clqwSVPvR44hLoxilT33+H4DMVxJwOIvx8st+GOiy9g=;
 b=oNih+S//syBfTherc3BQa7YPYWTQSajdcq+N40Zs3KhXxQk5qojKHI81+qoCwmqT4E4NnlCnZqeL4/KTEuolCY6td90aKZ51OewHg0U52DYYnEkbhmhcGwkRuxXcUMj6hfRXU2OMHHIZNyhGNMXNRI2GZBiLmn8vwC00Pv3rGT0=
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB6514.eurprd04.prod.outlook.com
 (2603:10a6:208:171::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Mon, 2 Aug
 2021 15:08:04 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::459d:3240:1c4e:b920]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::459d:3240:1c4e:b920%6]) with mapi id 15.20.4373.026; Mon, 2 Aug 2021
 15:08:04 +0000
Date: Mon, 2 Aug 2021 17:08:02 +0200
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v2] manuals: initial documentation for CVE management
Message-ID: <20210802150802.rjshw5x72khssked@fedora>
References: <169784CA8E208BFA.17923@lists.yoctoproject.org>
 <20210802145454.12521-1-michael.opdenacker@bootlin.com>
In-Reply-To: <20210802145454.12521-1-michael.opdenacker@bootlin.com>
X-ClientProxiedBy: AM8P190CA0026.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::31) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by AM8P190CA0026.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend Transport; Mon, 2 Aug 2021 15:08:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10e41b00-38df-4c1c-c000-08d955c753b3
X-MS-TrafficTypeDiagnostic: AM0PR04MB6514:
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB65144D1F76E0D1CF04386246C2EF9@AM0PR04MB6514.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:873;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	G5Qa4ZlbB1u99mL5DGbKjXs5I7vq7y41UuuKZ11dH124r7qvDiTuIPPbA0+PHaZfBwyQXJBMFMP+7hk2kfz1hy6v9DVBZ/KHZIZgPRawP1/++/rn18nRg+hm0goVDPMva1/vYxVQ7n4soylQW0isS4keJbSl9PuOdVM2lq1E+ginlSDEIgVxyNMYqhJKJy26REHkZjC1qFRBzEbx1SNukSdYQAmO8ka0K+ovFE8Xo0tT4iA6GbmcGQL7nNahcolYk4tivLKgHgZR2+PHxGRpu6Cqlpa0eeLnkDkqRAV5eBNfjI28o+5U1w3e4yB7/9hlNX1TaPh8GVxG7piF3U8CUYEO42FVDQFSxhqjRz6xkhQcPGpl1+JhIyrQgwsMTZZKMtBotgw5rnPC4myFsuIdsj2cVNLrky4uEC2hoj7dIn8djQzNHKAs/YY4BYU7I8xSn4BegPLQhuwi3/pleXwnj0cBlEfnKj5BJxlJPaO1I+xu18LrauM5+7fmhQN6Wgn9mhXU+IpNIYeKPXoSdT7IQfe2QpIJLcVsUV+7FCK6h8X8A1cOZamuJMBktO8p/rUL9t7Z6lnVvtK7eDPmfvoC1qiRFUVZ4+wkAymOkksofgWipaxWLSGr2O88p1Tr6qKOi0CRXQmR/Jn4BGShkA/kFVFM/PIPEUTFKY7S5pYWQ3YRL2TWkJcUEVary2U0s/TTQMpQHo6ls15PXSulaboIj/rxPGWSMknoUAxAmoMwbEFMV/o9X16wYi7All8St05bQl9+RRetSPuix+3O2k8//w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(44832011)(966005)(52116002)(9686003)(33716001)(2906002)(5660300002)(8936002)(55016002)(508600001)(956004)(6496006)(8676002)(26005)(316002)(186003)(9576002)(4326008)(1076003)(6916009)(86362001)(66556008)(38350700002)(38100700002)(83380400001)(66476007)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?T2e5ZTKAOTeG1F0g1j1bdF5FuEpTMf/+/fz5Kh68aeUJsAiwUO9zx7uH2cRh?=
 =?us-ascii?Q?sXMAKPEPLrDZoKReqZhPdZIK+jd5ohvgVqgA4f1QdzXLh9OFlr4b8Qrh/yqR?=
 =?us-ascii?Q?CvwwrmMOCWdH/Ru6McJ5hwid8V8p/PEM3CQRiZr7MWC2iQt7M0HlpTxCAOfI?=
 =?us-ascii?Q?M5N3Ghcv9PPst9Mgf39pVVC9tN3QrOWMXfCPjUvY5xbxdUMzDjVryVrrMReR?=
 =?us-ascii?Q?o4ST4dqK1BPTSq0rD61eHobk3wBQLo9TVI6zagb7UjP0Os/yDOtp+pN8S5Jr?=
 =?us-ascii?Q?XXEzLEyuD12gLIAV+a10L6AWQHH8x2o18ELaHncWwK6vGfuLNVmBGz5sjDKy?=
 =?us-ascii?Q?woIBPnCuainrL3v54t3sIm0pWMERruBgbtLkF5J2SxWxwnBGIE3ko6JpLH+1?=
 =?us-ascii?Q?L76k2CPLyXZy/CWBm6KM1ylLxxpa4TknVleQO3zj76RDFHCJwFpS/pi1empc?=
 =?us-ascii?Q?KKCBODdYAX5jHAq6+AydX9L51FScVaG9f/6VrJn7ACylyB2wNH6Q3g9hKIga?=
 =?us-ascii?Q?RDb5XK9xNsT8KtzLiTf8n75qIMll4ONAL5jHYIK7YRzGNVzo5VnuxekbHK01?=
 =?us-ascii?Q?h4knq5KBwnIYFdJ3n40E7sK/VVA5jihvolNtNbOrvjZTkdYTwoKq8air5SxY?=
 =?us-ascii?Q?V0ENw8YuAAnt1eiJvPxdHzcbMEX4fdXH2sx68KMfWWrZWug4nCPsXTrEoDN6?=
 =?us-ascii?Q?wb97GeEbpYw4IPo/MkqmtlPTtIphkrkWnOl2+FXIGeSk/A6WeGKUHrabwQGc?=
 =?us-ascii?Q?nyRkUqjt3MgIpUHutNt00NvIO3g54owNtOzSJohVZkVwyr5XwPobEUqodAcy?=
 =?us-ascii?Q?kBKQK0M21aPG1wqCxIVc6gFs3Gy07fc4xWrrrAyrRAGgL3V3aylgystIZZxu?=
 =?us-ascii?Q?jrf9a+0J0c95cn9VXVK47jWvjKH21VxNVSTppwXbRN7aT5/0jOXFFNOVhG2G?=
 =?us-ascii?Q?LHh9OJxMsjJ0ki/9Z4ZyLw6j9HXW0MDAHWCvfE5JJHq3P5T9yN7Q0mMLi55O?=
 =?us-ascii?Q?kNM4DIMF1hzBdR9bjfK6kS1Mg/hcwbCLSyqBom5j2RAt5coYCae5NJLQ+4NO?=
 =?us-ascii?Q?KwZh2MIMZ+UKIEnIulPlygq20/3ADFnoRnzEuxfWXsrHVsUkwlRw7A/NdUAU?=
 =?us-ascii?Q?lNaB146anYMBoqXkOHQmRAzI394w1rr6TwmKUnVh+O7t94GTZHSDpTeYgh1o?=
 =?us-ascii?Q?ETHOzYZmXwtLKGWuBfn2bAFNqHLVtr0lxuPi69J8OE192phm8xYAs/a9jF1s?=
 =?us-ascii?Q?NJ80pwGMcr5sX7OKb1yjTZmovbG8/1oknf7fcprB7ke1o8E01ckB2PtW9enw?=
 =?us-ascii?Q?aD3ZTQPTm9WehfMSprZEnDS3?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10e41b00-38df-4c1c-c000-08d955c753b3
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2021 15:08:04.1797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n+MwCMU0+lpUvUwQLySknm7lK7cnrwh0FKKE25n6Jt8Z+sG73KtUZNYuVxYIAaVEUBjn8ONr3UC+jiovoJnZ0eGUuwWX+A+3gFkmz/6GowCQxJYEd9/qTCEaBgqaFwOB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6514
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 02, 2021 at 04:54:54PM +0200, Michael Opdenacker wrote:
> This starts to document vulnerability management
> and the use of the CVE_PRODUCT variable
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

Reviewed-by: Quentin Schulz <foss@0leil.net>

Thanks!
Quentin

> ---
>  documentation/dev-manual/common-tasks.rst | 45 +++++++++++++++++++++++
>  documentation/ref-manual/variables.rst    | 12 ++++++
>  2 files changed, 57 insertions(+)
> 
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> index 9a6f4e1a8e..5905a650ba 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -10528,6 +10528,9 @@ follows:
>  1. *Identify the bug or CVE to be fixed:* This information should be
>     collected so that it can be included in your submission.
>  
> +   See :ref:`dev-manual/common-tasks:checking for vulnerabilities`
> +   for details about CVE tracking.
> +
>  2. *Check if the fix is already present in the master branch:* This will
>     result in the most straightforward path into the stable branch for the
>     fix.
> @@ -11090,6 +11093,48 @@ the license from the fetched source::
>  
>     NO_GENERIC_LICENSE[Firmware-Abilis] = "LICENSE.Abilis.txt"
>  
> +Checking for Vulnerabilities
> +============================
> +
> +Vulnerabilities in images
> +-------------------------
> +
> +The Yocto Project has an infrastructure to track and address unfixed
> +known security vulnerabilities, as tracked by the public
> +`Common Vulnerabilities and Exposures (CVE) <https://urldefense.proofpoint.com/v2/url?u=https-3A__en.wikipedia.org_wiki_Common-5FVulnerabilities-5Fand-5FExposures&d=DwIDAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=68NX1nF_VEaY3qnIv6t_na2KkkI92s-zN9-O0I-RXpY&s=4YQ4OIpH6f0vjS8ACzzw1ByorF7Q1oJngybYpJGHV6c&e= >`__
> +database.
> +
> +To know which packages are vulnerable to known security vulnerabilities,
> +add the following setting to your configuration::
> +
> +   INHERIT += "cve-check"
> +
> +This way, at build time, BitBake will warn you about known CVEs
> +as in the example below::
> +
> +   WARNING: flex-2.6.4-r0 do_cve_check: Found unpatched CVE (CVE-2019-6293), for more information check /poky/build/tmp/work/core2-64-poky-linux/flex/2.6.4-r0/temp/cve.log
> +   WARNING: libarchive-3.5.1-r0 do_cve_check: Found unpatched CVE (CVE-2021-36976), for more information check /poky/build/tmp/work/core2-64-poky-linux/libarchive/3.5.1-r0/temp/cve.log
> +
> +It is also possible to check the CVE status of individual packages as follows::
> +
> +   bitbake -c cve_check flex libarchive
> +
> +Note that OpenEmbedded-Core keeps a list of known unfixed CVE issues which can
> +be ignored. You can pass this list to the check as follows::
> +
> +   bitbake -c cve_check libarchive -R conf/distro/include/cve-extra-exclusions.inc
> +
> +Enabling vulnerabily tracking in recipes
> +----------------------------------------
> +
> +The :term:`CVE_PRODUCT` variable defines the name used to match the recipe name
> +against the name in the upstream `NIST CVE database <https://urldefense.proofpoint.com/v2/url?u=https-3A__nvd.nist.gov_&d=DwIDAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=68NX1nF_VEaY3qnIv6t_na2KkkI92s-zN9-O0I-RXpY&s=0qXvZ3HFd274JdraF3trFIxk0WTdWJUEOBl4wpOHCA4&e= >`__.
> +
> +The CVE database is stored in :term:`DL_DIR` and can be inspected using
> +``sqlite3`` command as follows::
> +
> +   sqlite3 downloads/CVE_CHECK/nvdcve_1.1.db .dump | grep CVE-2021-37462
> +
>  Using the Error Reporting Tool
>  ==============================
>  
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index b61de1993d..1150940133 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -1471,6 +1471,18 @@ system and gives an overview of their function and contents.
>           variable only in certain contexts (e.g. when building for kernel
>           and kernel module recipes).
>  
> +   :term:`CVE_PRODUCT`
> +      In a recipe, defines the name used to match the recipe name
> +      against the name in the upstream `NIST CVE database <https://urldefense.proofpoint.com/v2/url?u=https-3A__nvd.nist.gov_&d=DwIDAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=68NX1nF_VEaY3qnIv6t_na2KkkI92s-zN9-O0I-RXpY&s=0qXvZ3HFd274JdraF3trFIxk0WTdWJUEOBl4wpOHCA4&e= >`__.
> +
> +      The default is ${:term:`BPN`}. If it does not match the name in NIST CVE
> +      database or matches with multiple entries in the database, the default
> +      value needs to be changed.
> +
> +      Here is an example from the :oe_layerindex:`Berkeley DB recipe </layerindex/recipe/544>`::
> +
> +         CVE_PRODUCT = "oracle_berkeley_db berkeley_db"
> +
>     :term:`CVSDIR`
>        The directory in which files checked out under the CVS system are
>        stored.
> -- 
> 2.25.1
> 

> 
> 
> 

