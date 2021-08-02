Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.71])
 by mx.groups.io with SMTP id smtpd.web12.17719.1627896983344642336
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Aug 2021 02:36:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=FCcTYp4a;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.13.71, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MddVhT8zMtASvV131xONlAUuHDQaKKw6DyB0JOfRyrWT0FcieUitVUw6dPDLtVYcdrWJWWfoSgg46oUyCp7Ace2RfcwleUj57G2yA3zW/hUkOS+rgm5BwNfS2yMG0tKcXIxv16VqIdMxgitS0VL1E9RobWWoDm9j20bH5g99bU67sP5ANz8ZJZRWVg9SjkI3S491ZER0fr3nrKJUfGgtahrgP8d0Nt3C8xxJRcD+gGJQy2kqSp2LP+APjZpfTglzUdmvxbhj38kfEd1JtIIk0P8iy+t3nIawPR2cT9crVKRal3SlLZrzQNNkuXxn5d9XESVgaAjXX3G1Yie8wY15tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UwlplUrCT9mI9jEf8s3vdkJefGTC+SFnTTeHqjmMraM=;
 b=PU55PzA+Zc8m7QYINKXrTbjNIraqtGgzhUuf6wgeogZU4oZcqMaxKmBVppLyaVOYpM7prRCd4gURtyZO3L3aEN9vEAZEP1Kj6TsXXoM8aQnND5fKOlZ3Aoi9DZbUKkuoc9CuwA0/ew9PcZcQam3e5Dj+ggfFectDyaQuPCWE3tJXDv24JmkHWwfFz2d9xEg1Lt2Od8rPh/zXI7znWj5IbZGlQdwDFu1TiP4lxiLgOjNgXPJu+f0cMvPt+o1dYqPYPx7rL3i8CjZOoMdMMevJSe1xqJaTMrohVznizTZtvjFcCAjUW0MU3+yZ4jKLdM9rUgj9VB7wokcIDzfkQkYGOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UwlplUrCT9mI9jEf8s3vdkJefGTC+SFnTTeHqjmMraM=;
 b=FCcTYp4aG0KjRIBA/xvI7Sc0NarjLrMNeZxPmW8I+HQMhZpTS+/Sg1gG4qe2WnmmH+k/uhztS2BHCy8P2AiY3/FgHkKVyesAjJiRB0l2F0STPs78JDvaXV8RRt55X4kIwzLJYBZgWZyp5bMwv4lgTTNuJzzRdPzvTiqrn5p0C9Y=
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB5620.eurprd04.prod.outlook.com
 (2603:10a6:208:134::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Mon, 2 Aug
 2021 09:36:20 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::459d:3240:1c4e:b920]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::459d:3240:1c4e:b920%6]) with mapi id 15.20.4373.026; Mon, 2 Aug 2021
 09:36:20 +0000
Date: Mon, 2 Aug 2021 11:36:18 +0200
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] manuals: initial documentation for CVE management
Message-ID: <20210802093618.npbsjvxyh7x3pbtl@fedora>
References: <20210730185433.188851-1-michael.opdenacker@bootlin.com>
In-Reply-To: <20210730185433.188851-1-michael.opdenacker@bootlin.com>
X-ClientProxiedBy: FR3P281CA0039.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::11) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by FR3P281CA0039.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.11 via Frontend Transport; Mon, 2 Aug 2021 09:36:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6562ea6b-3063-4f85-5da6-08d95598fc29
X-MS-TrafficTypeDiagnostic: AM0PR04MB5620:
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB5620FADC7209CB9E529CB4F9C2EF9@AM0PR04MB5620.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qwILUCrcX9XZGBrbaMY1plqqIblf73kzBEadMiqDf1kAKf2q+01CUqaPRmEd9I9wl31Tl/Hl9w6OzhveKGNDciXVZojZy1Txmi/aFu+bVqQkZTGndyG5gE9Wrr9WtrMlgW10DKeREVAG3wsFqZOD1Tt+uNKbJoyBxIihO1DmjOH2Y+TGbtUyHcaC3If+dj1slcsUUUhuL8FPySIkHtZnkqbm9Aqs8uuFQ+4PU+BXuk1zAk6qa2DyqiRM+ZnTY1REmYS1cVIUlcHzYeMh9u8IL0rVFUNBBR9bvkMyLN3SwJ3N+sgDJlt8bmO/XvOu6MrKh9YILObDrZZyYEUC3Mp6zJdDtZLnkyVrQIoQaiDEyirKW8Jy7ZkWIqE6b9rlcYLL77LwvuZ7tvQHlDi165fmogPrSCkjNcK9uwdDNsyy6EiruAaKrxv4yl6LNBWaWsv97zuUVkxP2EvEjDdhjC7J8dONzaGRvCCLfGaaF4TccAh9TxLoYVjhkTJxi2jNMsV7sI+b85+V+FRHnRe3KeVHRi0YvmV5Hc3J4jyAEvJ2YfLIuFulF3DTaDmWEQ6xh7i0BdoZb7Zo9E1zQ1uBspCTc2T6c3SnAhRzOEwyDGfN1v2lFNe3T2+JA+CCm02bu6W6f2lJUTm6ExSUqCo7KlOHrWj+I46zLdGiy87kjtAen9apwKJUFjIZQrSypIE6zebh0Ji6ircoLmnJS1BFQ/gfGTxqIfiTS0xlmCxhYB2rag0lzrIHGQ5I2kwWOOeWcNXSBVwR/YtcPA863abuuUH96w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(956004)(66476007)(52116002)(6916009)(86362001)(55016002)(4326008)(6496006)(66946007)(66556008)(9576002)(26005)(186003)(44832011)(1076003)(508600001)(9686003)(8676002)(8936002)(33716001)(966005)(38350700002)(5660300002)(38100700002)(316002)(83380400001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VcCPlhVeqeBy13ADeKbo7Sj3sw7lCIxGtb6S2gvZGKYKQDiuBFS5kylAjf3b?=
 =?us-ascii?Q?4izItnoIGgqV++LW6qp3rNpJ5Gtd4hmQOUKn0CbAL470cu+eFHhhuccbfnPH?=
 =?us-ascii?Q?U+hzXN683fslGcPhI2/gLSnGyZlkQvOzkoXwekxfYW8cNUFtlTUykk26nSjE?=
 =?us-ascii?Q?bg8GJ1zlvwcogJ4FZT6G96GZ4fmM3My66C0S5cXgNkKlFoFS9LytqDilJCsu?=
 =?us-ascii?Q?u4+hqDBcc6edXSz4yQd5m7AJiY0NuQFOHKo/9H0jcRhqA3dWMPfQz/U2yHin?=
 =?us-ascii?Q?kImV1jh0oy8t8fJuK68c8o+dtP4SbvtbjZOgixV+wvuDohQM9oUzgxjYXroq?=
 =?us-ascii?Q?LmdTH2TUu1/7eJk46B+ntGhBE8P5TVBzzX9pJGLfg0nE7Sgua1ruXOXyEsHF?=
 =?us-ascii?Q?JGpkheMBGEPmRyu0AcG5DAadsRSlc5wD7kL6k5c/ost+57288PRivdi2G7Z8?=
 =?us-ascii?Q?qvv7XF5P83RRWFmBxV335whInnyEgtjzHB9T7JOZg3uXgPgMtI4W97UZtmWk?=
 =?us-ascii?Q?oKS98LZbok1I2/3i7XhABFfoBt6Ld9K0FAQ+O9skgZBfLA82q/wcWyvh4+RU?=
 =?us-ascii?Q?v9EjlKrBYfri5vdQ3wIkEW5ENdARLYu21q2S8qSFDmgtSi2IEX2If/z8tjNc?=
 =?us-ascii?Q?JGhdkc3+QJ4rBWZwf4JwNSHCY6A849jsxELQn/XN8FPfQ9uXjaMEURpq3RMR?=
 =?us-ascii?Q?wnDIp/aDVX9eAKWZ1ZYx4q/hUCN0RuOM/MLWvLww0j9ARGWqIxVW9sksIe2B?=
 =?us-ascii?Q?9qJXB6Gz2O8NC6pGxKKRNbSRAS0pTbQWBsky98e/R8GrELwiwptADCU0vnAt?=
 =?us-ascii?Q?EMcUUc/K2AKyMu9eothzdZifom2boFxfUI2yWwMkdeQBshft0TDJyZkjAPZ9?=
 =?us-ascii?Q?561Tgiet1UmrbQYeAcO2KBwrXYU/awx1yWF6ytFtuEWRqz8y/T2BZROINbPr?=
 =?us-ascii?Q?YpRl6g5wCqBp++TJ+JyCNc90Ez/U56JFaXbjLWsbFwKP3Qo8pWHy/XFvs5f/?=
 =?us-ascii?Q?05XrU1YNBVp2PmHQjSkmYUyJkfuoY/biHP6wRQH3LZJ5WaHvORcALmZ6q2Bw?=
 =?us-ascii?Q?9K+0cwmvOtnq/hnUbEPJXAZZ/jhk5MGX2akmL2wy68df6Wou/gl1tOL1ZAuO?=
 =?us-ascii?Q?PSEQyZSGqizHsE6Z8OCz/Bk5o2SNEOLKSDg5wsLLUHBngipo0sVWvP9h2SSQ?=
 =?us-ascii?Q?aCyFqdysBdxBi7f6s7n+GgrI1nv4zaoFowMNQgRoGElwOrCxAwUr0OZWbg68?=
 =?us-ascii?Q?Xd95WkyLG+tGea7MkXDTE7Yahhmk1aahgWBhaWQxraPNHzlxk91iXEiR46Du?=
 =?us-ascii?Q?pVXzAxyV3TM9nCqacT8ebafM?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6562ea6b-3063-4f85-5da6-08d95598fc29
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2021 09:36:20.4674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UDZmTyPM8a0e9cwWhHnmu1IwG5w94ml63jPxTiLmdwO6zUdoGtfYngPcfCqsg3tgRiyir1zOsxGzTNCDDvaBMOPgS3AXewf6a7X+ldUaTmsFFTSAFYeCl0N3BQmrPU6s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5620
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Michael,

On Fri, Jul 30, 2021 at 08:54:33PM +0200, Michael Opdenacker wrote:
> This starts to document vulnerability management
> and the use of the CVE_PRODUCT variable
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  documentation/dev-manual/common-tasks.rst | 46 +++++++++++++++++++++++
>  documentation/ref-manual/variables.rst    | 11 ++++++
>  2 files changed, 57 insertions(+)
> 
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> index 9a6f4e1a8e..aa296850f8 100644
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
> @@ -11090,6 +11093,49 @@ the license from the fetched source::
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
> +`Common Vulnerabilities and Exposures (CVE) <https://urldefense.proofpoint.com/v2/url?u=https-3A__en.wikipedia.org_wiki_Common-5FVulnerabilities-5Fand-5FExposures&d=DwIDAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=hekyLAdEcYu52ifxV5ERIziCTL0mv8hKI_2zFGHfCiY&s=6SHbCNpyGeEIS-wx0ocS3IvlInldBWzG0CPei2x4xWI&e= >`__
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
> +be ignore. You can pass this list to the check as follows::
> +

s/ignore/ignored/

> +   bitbake -c cve_check libarchive -R conf/distro/include/cve-extra-exclusions.inc
> +
> +Enabling vulnerabily tracking in recipes
> +----------------------------------------
> +
> +The :term:`CVE_PRODUCT` variable defines the name used to match the recipe name
> +against the name in the upstream `NIST CVE database <https://urldefense.proofpoint.com/v2/url?u=https-3A__nvd.nist.gov_&d=DwIDAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=hekyLAdEcYu52ifxV5ERIziCTL0mv8hKI_2zFGHfCiY&s=2VyieDwk2kXSn66jsySlUL_eB6CvuUWR-yRh-DMaIv0&e= >`__.
> +
> +The CVE database is created by a recipe and stored in :term:`DL_DIR`.

A bit unclear to me the "created by a recipe" part. I'm not sure it is
important information?

> +For example, you can look inside the database using the ``sqlite3`` command
> +as follows::
> +
> +   sqlite3 downloads/CVE_CHECK/nvdcve_1.1.db .dump | grep CVE-2021-37462
> +

What about:

The CVE database is stored in :term:`DL_DIR` and can be inspected using
``sqlite3`` command as follows:

[...]

?

If the "created by a recipe" part is important maybe it needs to be a
bit more explicit what it means?

>  Using the Error Reporting Tool
>  ==============================
>  
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index b61de1993d..72e1c832c6 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -1471,6 +1471,17 @@ system and gives an overview of their function and contents.
>           variable only in certain contexts (e.g. when building for kernel
>           and kernel module recipes).
>  
> +   :term:`CVE_PRODUCT`
> +      In a recipe, defines the name used to match the recipe name
> +      against the name in the upstream `NIST CVE database <https://urldefense.proofpoint.com/v2/url?u=https-3A__nvd.nist.gov_&d=DwIDAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=hekyLAdEcYu52ifxV5ERIziCTL0mv8hKI_2zFGHfCiY&s=2VyieDwk2kXSn66jsySlUL_eB6CvuUWR-yRh-DMaIv0&e= >`__.
> +
> +      This is only needed in case of a mitmatch, or if the

s/mitmatch/mismatch/

Technically, it is needed by all recipes, it's just that the default is
${BPN}.

I'd rather say that "
The default is ${:term:`BPN`}. If it does not match the name in NIST CVE
database or matches with multiple entries in the database, the default
value needs to be changed.
"

What do you think?

> +      recipes matches with multiples entries in the database.
> +

s/recipes/recipe name/

> +      Here is an example from the Berkeley DB recipe (``db_${PV}.bb``)::
> +

``db_${PV}.bb`` is an invalid name for a recipe name I think, can we
just give it the current version (and eventually says from which release
it is?). Or maybe we can just not give the full recipe name but just
that it's named db and link to its page on the layer index:
https://layers.openembedded.org/layerindex/recipe/544/ so that it's
always up-to-date?

Thanks,
Quentin
