Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.48])
 by mx.groups.io with SMTP id smtpd.web08.81205.1629446385543926244
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Aug 2021 00:59:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=ZYNsOqL/;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.21.48, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lqLxXSWQMnwhAlFIPYsDDIFNdp6j2ofmiEZ0mE2S7+745aJntrN484xkj7e0xtBLxGGArdO2QyGORblc7fvgu7nmNg0dhA8AuTusMjff4PvSRDFmMQRVJ8IiJAXkbf0KzEMG7LuHacXVapB8a0kEAF7SUUHoRkACZBWN9lia56Aqe15ni3v6SIiUEmvT3zKxPUrlGrbwciCrNSa+4MgMG1xhRdSkuznmMPdKEUGCKRCwOvRURqZSP8vGH+DeVO0t4eVodOIEqtq7KCZ5tmZpGQzEf5o5kSiB0XyOeTXcG90qZloz8XSWCgd4rOAQdMnkk2aH0FFKj6vfaCFQAEEd1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KeE4mPuoW1OBEYuYfBnn66ZYN4xeI+I1d8N73aSl9JQ=;
 b=hRLihz5iJHmhLBRbcCJ/nhsYx+EKVuptNv4ce8cpPyenzPUneT5hbReQpWU4fmn6neQsV2nkyGMjJilVEQhRjZHI2iFAavr/UvC+eopH3nbToc7bLa6QQTOtmpU44X82yvAQCfEXy3lZf/bndLdg9DXHsh3azGgoBrP5RJuF1YEm3NKvujFBp2JPqabWAEtHhbE14PuDQ0sYxlMb9rDvIZ2YyCuxDtDuhyxm0MstWqqAvP7d8Gfjk6VAy+zfhozGcb4YWpKkbASg8UGhsFlYqaTib1saMUZyCS2beUZHodVsFciOr9bRHFVPIKV1kSF8Rnp2zfScvf4eJWMCSDizKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KeE4mPuoW1OBEYuYfBnn66ZYN4xeI+I1d8N73aSl9JQ=;
 b=ZYNsOqL/gV+uve8cKYeTOuY/x4BehmWLvvnQo/XYC4giXIk3uux5HlhP5ZPwoU8MZkT4w3GRgQBlOMqbkuLzE5iCi3p4G2GIlw/ZeaVPL0tJVAIi4cIKrjb9BYpdQMWYNl/KsaRIhsPCLtgvg7FzZBFmrLq3nfZE4vj+BHUFk38=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from HE1PR0402MB3355.eurprd04.prod.outlook.com (2603:10a6:7:81::28)
 by HE1PR0402MB3612.eurprd04.prod.outlook.com (2603:10a6:7:7f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Fri, 20 Aug
 2021 07:59:40 +0000
Received: from HE1PR0402MB3355.eurprd04.prod.outlook.com
 ([fe80::8004:6d77:4496:12b4]) by HE1PR0402MB3355.eurprd04.prod.outlook.com
 ([fe80::8004:6d77:4496:12b4%7]) with mapi id 15.20.4436.019; Fri, 20 Aug 2021
 07:59:40 +0000
Date: Fri, 20 Aug 2021 09:59:37 +0200
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: Tom Rini <tom.rini@gmail.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCHv2] common-tasks: Add an example of using bbappends to add a file
Message-ID: <20210820075937.d3wazzbbfmybuffv@fedora>
References: <20210819151233.10066-1-trini@konsulko.com>
In-Reply-To: <20210819151233.10066-1-trini@konsulko.com>
X-ClientProxiedBy: AM0PR05CA0085.eurprd05.prod.outlook.com
 (2603:10a6:208:136::25) To HE1PR0402MB3355.eurprd04.prod.outlook.com
 (2603:10a6:7:81::28)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by AM0PR05CA0085.eurprd05.prod.outlook.com (2603:10a6:208:136::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.18 via Frontend Transport; Fri, 20 Aug 2021 07:59:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 01182e72-8eb9-424e-a32b-08d963b07662
X-MS-TrafficTypeDiagnostic: HE1PR0402MB3612:
X-Microsoft-Antispam-PRVS: 
	<HE1PR0402MB36128370F1718792EBA896C6C2C19@HE1PR0402MB3612.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:291;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yba/VM+mw7DbpeoBaZhsbbUjYCle5+JipckJv453r0eorBRFVEkMvhYBygESjnwAGyUvANFvibocYIP7CulIz9tlhBP+8TGjwIU5YTTX1fLKXbkVxcheb99zlrpFKv99Y4olqkobz9ueYYznBzDa5RqxaIgLgYmBe6WMp3hggp8OUU0fUbO2BjjMpm2o9mYmqb67+BUbI2d9W9rsyJCFDXh5VjWisK/NQL1uZCQHbnVOHopVSFdfURMFWTUO58G7xlDyfeHAVfgTUrVm9938RhqpN4GupcihyFlgazvA3opezZcMM3kWf5AYLfvV6Tv7fYYdIVzhlsVgXRpgsc8tpwPM0gCuH0FYkLKeSRlY4DyhtmMmK4TYBC3gXORd5YxANcApjoJfi1wrZyQro/qP5MtV+zFblLxrwY427XX/nIm74xor05zQlKYnRnkYDfOamilHcYWE54PTDwZyz5sTDqegURxpwZ8MlkI2/5BLvm0L+du/D0PZ8zvugVfH7XjIMep/j8aAyTFgjfuoVrtd3TlxOynQ/NVi8+YCP5kFmhThj0tHyGixcX4tKLi2hFVriixoOjZ666RUXdJR6qhZ1avs0vwrNBfJFlOzs5ZGWBKeEjNDy5vubnDYzAvYNCMHibQIbtg8wvx1MzenWqRupzgnyfnR8TaviCsMIyz54dmSz1E+NiYvjrTfS566teGHYb3BaWmtUleVz+WLQkDHIknhfZOpGQCEgSxpOOw/k0tEJDVCxHscfezIF3UpYrdGUKslMlXndgLfWXL2L4+qnYYrsekSx4URTiRQoZusvuPkkmlv0mvPEqtEO1gr4Ivr
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0402MB3355.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38350700002)(186003)(44832011)(9576002)(38100700002)(316002)(9686003)(966005)(4326008)(26005)(2906002)(5660300002)(508600001)(956004)(52116002)(33716001)(8936002)(1076003)(8676002)(66476007)(66556008)(83380400001)(66946007)(6496006)(86362001)(6916009)(55016002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?AOqc2pS/8eD5urLqd2qnL65/y2FeTtmR7sJLTUUq4dNjfcgebL/+RjKN3Txl?=
 =?us-ascii?Q?EaBrsVK1JpWCd004Re6eIFW3DUmfHrRnutK3RylfqxrXYU9WgF6CU4XkDKzF?=
 =?us-ascii?Q?fOa9AOAeggLPWOl+Rb/corSHL2915kZWerj6lXQE/bi3DSndsNDOyegX4v+6?=
 =?us-ascii?Q?80BlPJb+n/bvYp0W3bZypjeo4O65PiGTRaFP0UVW9G8atl5sq3DJLYQ8S9iD?=
 =?us-ascii?Q?OGfUT/EcZPq5q25cG2j/OqlEYgg4evzG5qfUtTz0/RYHxkdfptE2FN3winCP?=
 =?us-ascii?Q?cfs1OAd3BfoZV1nltEEgDw83ZkBU95Ua3nHvEap2XURpWVtmIsTRV7cM46gB?=
 =?us-ascii?Q?4nYmaijBBd/35aBcMGEFl+CjrIbcCBV5apzGzoh8D+jT/qsehKdaayweqsh7?=
 =?us-ascii?Q?9qBHtIE2nonSg0/dqmnWVoYLVTL+kEUoWOGjt2OYo58fXwjiYQ0n7NUBfd6y?=
 =?us-ascii?Q?WlVDGYSHGBv0o4UvBScQOr7t0o0G/z1Mi1dbyC+NZLOwcyyUn4d0Nq6g7dW4?=
 =?us-ascii?Q?3Shy9DOdbUcsWQ1Sijy5bN5hBCKCbwMqbVAUdfX+1yFEMyj+wmOpn9ahXbFj?=
 =?us-ascii?Q?wfhDqv/w7qQrdOjX7kLiFJAqIYejev4B6ScVUvUBh0KeQnJ/z3a0vqOP4/G5?=
 =?us-ascii?Q?sV3aq7MsWHVAlgLIYdQhA9KqUDB0qFTLJHEnvohCLxqJByJWowEjtTRgrTaj?=
 =?us-ascii?Q?ybo6A7Nvmtu6/6X0LqfFgNzfo2n9y7n4FRLkIKbG1YoD7sOYuN9WjvzuO/yM?=
 =?us-ascii?Q?qSpHiXf2eC5XgIsF7dPvUW99lgzNtz1jA8GHnKVwkenBsZOEMI4TxLcjB30x?=
 =?us-ascii?Q?m/HFHbFmDHLgCOvpSh+A8HWCmeT/+beqlJbetW7FS07UHEsg5ApZ6vSACn5w?=
 =?us-ascii?Q?R0rHliuRWMLMPCZvhqOky4Qq0Fd9QAVh8lsFmxYS1X3SR7slHl7dztUHds5j?=
 =?us-ascii?Q?u4asgjAgbMf9VOxTslHeVPvGmGuAmX569gm7FwsG8BdQODC60ONjKLipJwmT?=
 =?us-ascii?Q?XEMqauXhhuwVzamtl1bMnXb6vcd8GC21Q/MS8/WhxdLa+BZAKC+QVOyJSKe3?=
 =?us-ascii?Q?J2K0Yd2jgS5I5O0mkoYUcram7wzEVgPuoQuW62kq7D7QrlIYoYUhhYsHDS38?=
 =?us-ascii?Q?NxbTd7q+zY3j9UN6n9qls19drEPL0QxpbicdMEnOzJcWTPsUx1+p2HjuyPo3?=
 =?us-ascii?Q?PfK+CDlopfkStFOfSJdkly0zJ90WpTB1q/vOdsNlntVxz13REuvkUFxa4ySA?=
 =?us-ascii?Q?l/aqgDIdxySoZCI/6OXVqqvT5q+QyHk6YujZ0zEz/E7Yp1N2uMMHkJKZ+Wea?=
 =?us-ascii?Q?zKOIsK1uqeLIO4TeFNNXm+ae?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01182e72-8eb9-424e-a32b-08d963b07662
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0402MB3355.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 07:59:40.3983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: foCtUqyO8nZ8KfoBA7trhEEGYJV5AIW3yuVx8ezhr4fo0Qfd/Q63NsrwQVibFS3LJ/JYEoRqi1zoic/qMj/2ZHgJEVC6cJQl0dWFXkI6TarYctjVZtrbP5+DULCtudeE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB3612
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tom,

On Thu, Aug 19, 2021 at 11:12:33AM -0400, Tom Rini wrote:
> Use the xserver-xf86-config_%.bbappend from meta-raspberrypi to provide
> an example of having a bbappend file add files to an existing recipe.
> 
> Signed-off-by: Tom Rini <trini@konsulko.com>

Reviewed-by: Quentin Schulz <foss@0leil.net>

Many thanks!
Quentin

> ---
> Changes in v2:
> - Based on Quentin's feedback, submit a fix upstream to meta-raspberrypi
>   for their FILES append usage.  Incorporate that now that the fix is
>   merged upstream.
> - Incorporate Quentin's syntax suggestions.
> - Based on Quentin's feedback in the summary paragraph of the new
>   section, reword to be more precise about when things change.
> ---
>  documentation/dev-manual/common-tasks.rst | 61 +++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
> 
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> index 4a5011ea749a..5a0443c8ee5f 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -554,6 +554,67 @@ The end result of this ``.bbappend`` file is that on a Raspberry Pi, where
>  used during :ref:`ref-tasks-fetch` and the test for a non-zero file size in
>  :ref:`ref-tasks-install` will return true, and the file will be installed.
>  
> +Installing Additional Files Using Your Layer
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +As another example, consider the main ``xserver-xf86-config`` recipe and a
> +corresponding ``xserver-xf86-config`` append file both from the :term:`Source
> +Directory`.  Here is the main ``xserver-xf86-config`` recipe, which is named
> +``xserver-xf86-config_0.1.bb`` and located in the "meta" layer at
> +``meta/recipes-graphics/xorg-xserver``::
> +
> +   SUMMARY = "X.Org X server configuration file"
> +   HOMEPAGE = "https://urldefense.proofpoint.com/v2/url?u=http-3A__www.x.org&d=DwIBAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=-29DA_-pdEqHQSyf0kCmWI525NPKUKUY41Sj1r21ZFs&s=_ME7L8fLob_4Mm6mqS2PY-QPwWTcUwliVPk6FqSOXk8&e= "
> +   SECTION = "x11/base"
> +   LICENSE = "MIT-X"
> +   LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> +   PR = "r33"
> +
> +   SRC_URI = "file://xorg.conf"
> +
> +   S = "${WORKDIR}"
> +
> +   CONFFILES:${PN} = "${sysconfdir}/X11/xorg.conf"
> +
> +   PACKAGE_ARCH = "${MACHINE_ARCH}"
> +   ALLOW_EMPTY:${PN} = "1"
> +
> +   do_install () {
> +	if test -s ${WORKDIR}/xorg.conf; then
> +		install -d ${D}/${sysconfdir}/X11
> +		install -m 0644 ${WORKDIR}/xorg.conf ${D}/${sysconfdir}/X11/
> +	fi
> +   }
> +
> +Following is the append file, which is named ``xserver-xf86-config_%.bbappend``
> +and is from the Raspberry Pi BSP Layer named ``meta-raspberrypi``. The
> +file is in the layer at ``recipes-graphics/xorg-xserver``::
> +
> +   FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
> +
> +   SRC_URI:append:rpi = " \
> +       file://xorg.conf.d/98-pitft.conf \
> +       file://xorg.conf.d/99-calibration.conf \
> +   "
> +   do_install:append:rpi () {
> +       PITFT="${@bb.utils.contains("MACHINE_FEATURES", "pitft", "1", "0", d)}"
> +       if [ "${PITFT}" = "1" ]; then
> +           install -d ${D}/${sysconfdir}/X11/xorg.conf.d/
> +           install -m 0644 ${WORKDIR}/xorg.conf.d/98-pitft.conf ${D}/${sysconfdir}/X11/xorg.conf.d/
> +           install -m 0644 ${WORKDIR}/xorg.conf.d/99-calibration.conf ${D}/${sysconfdir}/X11/xorg.conf.d/
> +       fi
> +   }
> +
> +   FILES:${PN}:append:rpi = " ${sysconfdir}/X11/xorg.conf.d/*"
> +
> +Building off of the previous example, we once again are setting the
> +:term:`FILESEXTRAPATHS` variable.  In this case we are also using
> +:term:`SRC_URI` to list additional source files to use when ``rpi`` is found in
> +the list of :term:`OVERRIDES`.  The :ref:`ref-tasks-install` task will then perform a
> +check for an additional :term:`MACHINE_FEATURES` that if set will cause these
> +additional files to be installed.  These additional files are listed in
> +:term:`FILES` so that they will be packaged.
> +
>  Prioritizing Your Layer
>  -----------------------
>  
> -- 
> 2.17.1
> 

> 
> 
> 

