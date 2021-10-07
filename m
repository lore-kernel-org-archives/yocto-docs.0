Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EAA9C433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Oct 2021 11:05:47 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.65])
 by mx.groups.io with SMTP id smtpd.web12.9981.1633604745660579984
 for <docs@lists.yoctoproject.org>;
 Thu, 07 Oct 2021 04:05:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=ZcCFaios;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.6.65,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EIr8ZrdxXpmuVnYD0nBsgJPDYFdPouWjjMq4u1bA6r4mYcEXDLZKRMioSDn8sFasjhhyxUSeDEPhB6qLRI791KhRwLdCaYaOlNvDNpTGX5TTdpHjcCHfxTjwx9mp0ImuwQyRUHs4UcimuuLbq0Mgp8qtPQRvic5Tc44xtQe/hglIFFU0NYF8+O5yBSlW7o6JMI7qydBgUdmAcCs4j8j3Qsc4B+9RFEu5AO5s+jmHCILaptY+RufhNWuiEXp882q1pFkc0uxI+I74xVOa4FXG7/+H0lgBaVtO1+KtH3DXXK2/6fsv6BJKQnZvztRDkDNiNsF/5oyq3JypvDXvjz+Ueg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LYQe+AF7bocSq9Ze6MEg10SQMt6F3clyGe4nPmETdA4=;
 b=f1kufCFBaCyXK1lPhtAoZH3e1sOr+cyGZR1i4LmSKSdSvSQWSCR92CIgqj9Jx23oanR8uxAEl9aXCPUjzQJfjJ9Tjvi2TiWVmOAoud9Cj1reWQkG//HBA4xMXLJBWMmYGaVsh7EHxYDeWcubauX5vWXWunr52mBWlQjpor3s9AVgagEKhNg/tMbdcvAZI4l2y7KbcYoGgy0wITOxBXel6VfBkG79Kzzd8zzFkmWTRB+IT6Ll9V/k0eDSkIUxX24DlI7EmZhMfUq5vnHRTYBjsi9x4WA7w1Q2Md/wCOH2IxzC40zjzJ6Eif/CKy2yGc6083L+v/gBwSqWGDAwIvdj2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LYQe+AF7bocSq9Ze6MEg10SQMt6F3clyGe4nPmETdA4=;
 b=ZcCFaiosqYZqm1ZLGDWhRHwCiCgV2CvAzVAVyp7sc8o0Ipnz9kYMpctL62iBZm4IkT4Hi5iGlIX4F3GxzfnPdlnW8Z7Lld43felH700oM34D/hX7az6ddDBjeVX1gOiepMuhS53nzn+5f6f9870n5xiexDy6j2+9uax9hpLJWd8=
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB4979.eurprd04.prod.outlook.com
 (2603:10a6:208:c7::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Thu, 7 Oct
 2021 11:05:42 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a%5]) with mapi id 15.20.4587.019; Thu, 7 Oct 2021
 11:05:42 +0000
Date: Thu, 7 Oct 2021 13:05:41 +0200
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 1/4] Makefile: allow epub and latexpdf outputs to
 use diagrams from SVG sources
Message-ID: <20211007110541.3di4bkym6jj47un3@fedora>
References: <16834414503E8A25.21857@lists.yoctoproject.org>
 <20211006122238.959343-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211006122238.959343-1-michael.opdenacker@bootlin.com>
X-ClientProxiedBy: AM6P194CA0068.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::45) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
MIME-Version: 1.0
Received: from fedora (92.42.140.82) by AM6P194CA0068.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Thu, 7 Oct 2021 11:05:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dcc8ed97-ae55-4fc4-bb1c-08d989826792
X-MS-TrafficTypeDiagnostic: AM0PR04MB4979:
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB4979F7F306D618E9C9D70119C2B19@AM0PR04MB4979.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	24nkmIYN0H626gPcbuLGx7bJV+Npc8vxCh6uZpODacvN9CifXecZohsJk82rO6mhMS6P8cNCoQti6w7rD3+N/X9CnWBKy58GWmJyoQCMOL0IVT5njhb1F99z/oMsCcJUQgRsvJPfVQNrAG1iLzvexmHR0HbJ6KC5QdCioqnq9V/bgAu3yIj/Z9+Pjw4AO/vOYosRKNyVoXfEb6d8ymzy+UXoROJvxWDMQ9zcC7/qN5Xxt6Igd70PVzwjrz0sorhlVplosF7lC+PFNSPe43RYhxo7n3DjlLyWgxKp31rxALFN3kEOEIEKaF29RpMp+HWUGa+z4wy3Fy9SV7AUJMwMCUKTQ4sdWI93qekXEBvft5FMa12fxQkTnZWNUnIJ0obIabtGdOIpsStYLTQj69UOZNhCX9BRZEJk0Xg2hLG/SCakCIQOx+Z60o38NFLRFOucpk4Kjrr6sFsfKzh4Q/kDi7gFkALo3pwXB+RYJqovY71f+Nvq9UMTEEXweC3tXseNvbWHwQTyHdeHSypO4u8NTgfS1DrgRDFV6dmw3C6e3HzKUPYbYliVedpmwQv8CV8BrYW0L2r4UBMQ9p3n5nU4TGOh2m8PvsUMptAz25IaqKboJbe2M30sow8En+P607/kX/9OH5MljInUksxiiVBOH0BNa6qN1o8Ov6feqOT3sMk44aQ3jjVaPUZT3W888at8kKoTK3/nefN0o5MbcpBprg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(55016002)(508600001)(66556008)(2906002)(38100700002)(44832011)(8936002)(86362001)(83380400001)(9686003)(5660300002)(186003)(38350700002)(956004)(316002)(66946007)(4326008)(6496006)(1076003)(6916009)(52116002)(9576002)(8676002)(66476007)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zyNz6xHDdKbnZ+U2OMmLzDz68Ri/MuIYrjjFvKR7kTu57Y6F0rarh+/gupGK?=
 =?us-ascii?Q?dKx/gUnNpCAgfY+9ssPf5wZKIvsO6QncW2l3K731JEmUz1esXtdoNa2TomaB?=
 =?us-ascii?Q?2P7PdDdW2C/OkxhRxahVUJmyBdUdxrGjVquKxPNEtufEiBb2JiT5LjQhuNL+?=
 =?us-ascii?Q?NP8BrDrogLUX880tJIsVgjCtCxEzckSoDv6sNevYwjNSbHxgX8CWf+0Y0/2F?=
 =?us-ascii?Q?0yrivfHY0XvPskEdAmf+h+EzfJyxRW2lm3+RMmCb7GLB2NE2kLhi0aap8dsn?=
 =?us-ascii?Q?Jxx2IbHMjlJi4XCi4mECtPTUR6UIlhANJKHi1T1Aw7dnBM527eslcxqkT98T?=
 =?us-ascii?Q?TMCT60sQP/qq+LHzCs3LHL+8ksmtUN+wennjTC1C3GDbZvub2QwZRYqj4MEN?=
 =?us-ascii?Q?NFRhbjunDV18SIy3O7fKDMGG5S1PidTcWHaVURY/EUaeSaUbaPNIzYzFW71O?=
 =?us-ascii?Q?U+YR24gKr4EpwBiFBWzjVufDDzow2k9rrAxv2mQ4/qG1XRsfB6kr00GRUWYw?=
 =?us-ascii?Q?D5LpQL4/Pb3KjfYgeN+0ScOOV20YpzQullNyqeRfW9sHNV8lCFYXX6li38p3?=
 =?us-ascii?Q?/fi+TSFvg4wjwWSD39RVpeCH/aGg58N3LU8DeN+EnmF2DmtRbHDB+lR3wAcU?=
 =?us-ascii?Q?8SQE5PITh5X0oRy/smclcjqkXsmaVyp4DXqGYZI495F+hkddepFZx7vDSl+5?=
 =?us-ascii?Q?e5KuwdtRMDhutfOzcyNKqBrt0mlI17OPdV7GLokHld4o15J4bqFgToPduItt?=
 =?us-ascii?Q?vFTLtnzWmkQcTzbBGi57hr8nO5JQ4bRAx5jnDzTzFxELRw8GykU2HQIYGohL?=
 =?us-ascii?Q?s2eZiX2VD5ao+f8vDvIFmQs9KEICyWxLtC2v+opgbe0d1GVbSioK/9pxRjgM?=
 =?us-ascii?Q?NGEdgV3W6FHEUHKvIBomcNCaQ46DjykTADDnoKpL9fvuiabuKMzq+n4hMnRT?=
 =?us-ascii?Q?vXLsqqe9a7rLs/4q09l35LQBCVkgP/uWwTm7CveemdiUBsNsoayY6GPdv3+R?=
 =?us-ascii?Q?D7TR/SAOTaUSrRjnZ5JCkHBdYrgbzg9w2l8LkTHqV/KY8RvSoz7vk+xsG1uf?=
 =?us-ascii?Q?hPN6kKuSHi+EWuSs9Tyyktj1WMYyGgyY2jey4sUUOd9RwKInAiy2vp/wTalq?=
 =?us-ascii?Q?D/HvIMIwTctmScH2KQm1+WNXtOmNZuEJQl3/Z1Vs/V6cM4msSlP5k0ANF9fH?=
 =?us-ascii?Q?oPDmfoA+NE/qteI8w38tt7sVe4s5jH+ZC3eKuIFKNsT5zWm6gxaReb08IGOX?=
 =?us-ascii?Q?ZKLg8BAy9rovI+P5xyE1yb/N74zkrjMMsEaECka0RStnGROSfsbZxRGiAmkG?=
 =?us-ascii?Q?GCaxsfIKr79onRMC73nNp0Zy?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 dcc8ed97-ae55-4fc4-bb1c-08d989826792
X-MS-Exchange-CrossTenant-AuthSource: 
 AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 11:05:42.6968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 km/KuKaXGUROrNqSBNEhZ4onaaD80ev4EGKdhWyMnv7e/CE04nugVgKWdVWSlIRNJtZfRPm/B8rkSAmwfcNmguEQinnhKAmLwSPMXMyPg3LL35BDpA2xv5ZNilqWE44E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4979
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 07 Oct 2021 11:05:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1944

Hi Michael,

Your patch series is missing patch 3/4, can you fix that (send the
missing one or renumber them :) )?

On Wed, Oct 06, 2021 at 02:22:35PM +0200, Michael Opdenacker wrote:
> html output is great when directly using SVG
> epub output has to use exported PNG because of issues using SVG directly
> latexpdf output cannot use SVG, it needs exported PDF instead
> 
> This adds rules to generate PNG and PDF formats from new SVG sources.
> 
> Newly added diagrams have be stored in svg/ subdirectories
> so that PNG and PDF files generated from SVG can be "gitignored"
> without ignoring the original PNG diagrams that have no SVG source.
> 
> Note: had to remove the dependency to "Makefile" in the final "catch-all" target,
> otherwise it was also catching the SVG to PNG and SVG to PDF targets.
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  documentation/.gitignore |  2 ++
>  documentation/Makefile   | 29 ++++++++++++++++++++++++++---
>  documentation/README     |  2 ++
>  3 files changed, 30 insertions(+), 3 deletions(-)
> 
> diff --git a/documentation/.gitignore b/documentation/.gitignore
> index c44580b088..35ead8af66 100644
> --- a/documentation/.gitignore
> +++ b/documentation/.gitignore
> @@ -1,3 +1,5 @@
>  _build/
>  Pipfile.lock
>  .vscode/
> +*/svg/*.png
> +*/svg/*.pdf
> diff --git a/documentation/Makefile b/documentation/Makefile
> index 996f01b7d5..f015026562 100644
> --- a/documentation/Makefile
> +++ b/documentation/Makefile
> @@ -6,8 +6,11 @@
>  SPHINXOPTS    ?= -W --keep-going -j auto
>  SPHINXBUILD   ?= sphinx-build
>  SOURCEDIR     = .
> +IMAGEDIRS     = */svg
>  BUILDDIR      = _build
>  DESTDIR       = final
> +SVG2PNG       = inkscape
> +SVG2PDF       = inkscape
>  
>  ifeq ($(shell if which $(SPHINXBUILD) >/dev/null 2>&1; then echo 1; else echo 0; fi),0)
>  $(error "The '$(SPHINXBUILD)' command was not found. Make sure you have Sphinx installed")
> @@ -17,7 +20,7 @@ endif
>  help:
>  	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
>  
> -.PHONY: help Makefile clean publish
> +.PHONY: help Makefile clean publish epub latexpdf
>  
>  publish: Makefile html singlehtml
>  	rm -rf $(BUILDDIR)/$(DESTDIR)/
> @@ -26,10 +29,30 @@ publish: Makefile html singlehtml
>  	cp $(BUILDDIR)/singlehtml/index.html $(BUILDDIR)/$(DESTDIR)/singleindex.html
>  	sed -i -e 's@index.html#@singleindex.html#@g' $(BUILDDIR)/$(DESTDIR)/singleindex.html
>  
> +# Build a list of SVG files to convert to PDFs
> +PDFs := $(foreach dir, $(IMAGEDIRS), $(patsubst %.svg,%.pdf,$(wildcard $(SOURCEDIR)/$(dir)/*.svg)))
> +
> +# Build a list of SVG files to convert to PNGs
> +PNGs := $(foreach dir, $(IMAGEDIRS), $(patsubst %.svg,%.png,$(wildcard $(SOURCEDIR)/$(dir)/*.svg)))
> +
> +# Pattern rule for converting SVG to PDF
> +%.pdf : %.svg
> +	$(SVG2PDF) --export-filename=$@ $<
> +
> +# Pattern rule for converting SVG to PNG
> +%.png : %.svg
> +	$(SVG2PNG) --export-filename=$@ $<
> +
>  clean:
> -	@rm -rf $(BUILDDIR)
> +	@rm -rf $(BUILDDIR) $(PNGs) $(PDFs)
> +
> +epub: $(PNGs)
> +	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
> +
> +latexpdf: $(PDFs)
> +	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
>  
>  # Catch-all target: route all unknown targets to Sphinx using the new
>  # "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
> -%: Makefile
> +%:
>  	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
> diff --git a/documentation/README b/documentation/README
> index 1e7b4f0e65..6b72f82441 100644
> --- a/documentation/README
> +++ b/documentation/README
> @@ -113,6 +113,8 @@ To install all required packages run:
>  
>   $ pip3 install sphinx sphinx_rtd_theme pyyaml
>  
> +Also install the "inkscape" package from your distribution.
> +

This is needed only to build epub or pdf, might want to specify that?

Cheers,
Quentin

