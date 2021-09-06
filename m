Received: from EUR03-DB5-obe.outbound.protection.outlook.com (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.76])
 by mx.groups.io with SMTP id smtpd.web11.22283.1630935235870417103
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Sep 2021 06:33:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=Bv4RRPrW;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.4.76, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n7B77fIHVxUuYfSkCHS83mncGK0v3bZ3R/NshMlTiX5TVdxhb3akC0QLUIoLTakDxhrrIKXHlxndg9sVJAvHGbq4HINXhkY/VO2s5JIkm026t3hi26cYR7ud6H2jziy5fAWGda4ZL/grP3A+5ObRsgd3HgU7CmC7NrAFSOX33pJe4GkI7wc5kjH5ATd+QWrTz/fkTA8+VMpTF4BHivAcKmzRliyo5mS2Pgw616/aNMIkWk+LUKWEUBmkeo6IPUG3dBwgF5eAUQxABIgXOEgLYBFXfOSQyiftJejKG7Smpx3nmCb2MtV66k27A0Qd/krMUutGje4+pDPYNp9DOFpKyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=xF1EHPRX5JQ9PaxVyVH1q8kBAIZWCYlVcgyRJtm6Y78=;
 b=nIq1rdjyZKQCknRNlWQcPfTP4QvSHbMECp7ITPijIuQZ+JgEwJf5TRPFvlIcPPfPgmO43FFcGdhTVAKOX2AwM/VS3cmVe6le6PF3plor5RWzQu6vbltPQJc67w1WPSbeHPxYklchNyKpKshQNw6AbTmYGv+m5C1Z5dFpKk2GwCTCaIpFKxFujMIocc+ZhfANEac2Cws4PC0ER6jVyB9vU7VfclFesBPqCiq1NgS8ur+g3p032e8N2yiFP4D+1CnJhrkwrH/eqAAM994cvXgkNSpn4ip1bplhzc3bHf8Lbp2+bfmGbUzzRRB3Cnubq6g7jpTXyf/pEYb8EHqw+j0d8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xF1EHPRX5JQ9PaxVyVH1q8kBAIZWCYlVcgyRJtm6Y78=;
 b=Bv4RRPrWcxi5Kxv6f8WK3fTsP4ZIQ5mNDTSBqn3h0pWPkhUPMeMwx6X6hUia2uelJQ8UsJWYaVMxqXm9U0j8VZybJXzGzsZJ9uicQBPfJfQAbSXvv274rrt8pm62YNd1GmifuDNIO496afMARLvZhwBR5rpTL4rzeCeulPI9pSI=
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM9PR04MB8276.eurprd04.prod.outlook.com
 (2603:10a6:20b:3e7::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Mon, 6 Sep
 2021 13:33:53 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::706a:b082:742a:7d00]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::706a:b082:742a:7d00%6]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 13:33:52 +0000
Date: Mon, 6 Sep 2021 15:33:50 +0200
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] manuals: font fixes
Message-ID: <20210906133350.fcijjn7u4yhisibq@fedora>
References: <20210903085125.2033899-1-michael.opdenacker@bootlin.com>
In-Reply-To: <20210903085125.2033899-1-michael.opdenacker@bootlin.com>
X-ClientProxiedBy: AM0PR02CA0180.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::17) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by AM0PR02CA0180.eurprd02.prod.outlook.com (2603:10a6:20b:28e::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend Transport; Mon, 6 Sep 2021 13:33:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b08d59f-99f9-4f36-1a74-08d9713af78c
X-MS-TrafficTypeDiagnostic: AM9PR04MB8276:
X-Microsoft-Antispam-PRVS: 
	<AM9PR04MB827604963C81FD645FDC1E11C2D29@AM9PR04MB8276.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:556;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	c1dH7c0g7jUO++y99f/fiEx2JWoQoD4j0YeuInmk4vSOhuyOfXMXJ2Uiax7EnE8b/lab4sIRJvFSmJi9Z7Pdf2E0iwcjrzteWB68WbSRB/7iHq5mMTwAJ+kIQyIhlZkkHKXv6ry0rFtzmY8mbkwW1ibffWs++3fEiTUh6LknE0ZfDXlTXZf7WEjMV6wyXYcQL2/cqusJzRJneWi2Qk2avPEQRgDL0/n+IT0kEugYLuHEZBSNpeegyb3dYS12nybrsbKXJpNzvQok/joQ04KjYd0GmoAE4QWAusFqV+SaBztNsKYAGVUG96jUTwUCxvhk8UYwRppDAUnjOjkDVtKOGYoWU0RyRESJ9v3Ui4pPNdpC2/EB721xhp8SOr2fhOgK0+ROyreh7AOe1V3sEu6twvsL7SmtJJ0bjPzi42IQpzVU38XymsIsqgDLDqBP+aF6iOkLqe1iFhqP80bl7HUt04gHtzPu/YhtFApw9qEGUEPtQcIGbHgVEAgthqiaInxlwpn4mmNMtHlykSy0/ja6Pu8Q/ktifqiMtaVsrmBoXM7CRVQbCYu3TSBQU6Ilu6R6RbOUpgVjqWaSUs69Ne+moTJi3d3sKkK9LQPl1uL7AG8bU9knhs+bbDemyUJPebouT3nnJM8XXxQbE+UisiMnAILA17qcf8l9a92q16MDEYhVa5uRCv2g8Tgmh74QTyPMtQpfFwrHHy1WNXw9NXYBgeNNj47QNnp1hslPhb5vrJtov5+gpjXsgUacWF9RItMm1TqvrC1dB0RYg/3wdx0h8vdx3/MpTEkp3TH6lIZScFJXBd8yXdzNMqTJqqbZS4hm
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39850400004)(376002)(396003)(366004)(346002)(2906002)(8676002)(316002)(52116002)(5660300002)(6496006)(186003)(6916009)(1076003)(33716001)(83380400001)(86362001)(956004)(8936002)(55016002)(4326008)(9686003)(66556008)(66476007)(966005)(478600001)(66946007)(38100700002)(38350700002)(44832011)(9576002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BGPnY5duoGb6KyI+uNBZTnreZZCyCHK5INH5D3z8qF5mcDlJkF8Owu+3xPm6?=
 =?us-ascii?Q?+KXXoVGbaiexOJ3U/ivY80vGp54t7s3EmRtvpNgCiVA4xNLwtt+Zk5/fPLZ+?=
 =?us-ascii?Q?mNWbBw+MEvhZ5AiS0YLGYKcmZfgboUj2pxbbGqzgTWHmICnbbsgvMBK2VIz2?=
 =?us-ascii?Q?AALZnNHiJmFV/IquUOx7nQMg6i/wNdzvbHSvUW9eBuCJJO4kPNRRw5pT6H9R?=
 =?us-ascii?Q?jpTaudxnZM6Mg6iqp7hXSw0D/WeinrvXVUdwQSMHk1m2cmhZr9R70hBc9h4i?=
 =?us-ascii?Q?KaKtaERfy0BoyP1ww8rWfgk62HY3LVfiauY0ZrBXfSYPj7iqkk8KnBhZzYe/?=
 =?us-ascii?Q?cA1uTVbKeJeJ8jxAjaIPNetqbh0tSPVsgfnr/my3HXNW3ceb3PhgQJwnVxuA?=
 =?us-ascii?Q?BNbsiTG0S7m/XJuPiNFZmkO6mz/kpuIiWrFGBgzaGaamQxRuYyoOiL3LRvN/?=
 =?us-ascii?Q?Jl1Q8ag4NovXozg3VDcGtrRU/Od3MQZOezAcJuboNbXGbscEecmvIgpQa2Wl?=
 =?us-ascii?Q?0YkolRl5oysWFpSyUZagAZOfllSR/m4CQet3ni3YgNECl2y0Y+1K6S9Apzon?=
 =?us-ascii?Q?dJvLjG+4vCpCC99ll0IkZneJbrggmF7gXJbj/fU5+V/xctP6/RDWXZ4pTjzR?=
 =?us-ascii?Q?iC4jo9BNZ6PswLDdp/O7ChvDEeQADs1B0gi7szPAm1yaGcBlL0O23ZzjwQQS?=
 =?us-ascii?Q?4o5ydbyx+oP7whLYJYqx0JCm23pru610fyYJuU+sfiYuYpw73HrQEJjieRkU?=
 =?us-ascii?Q?aTKv0Y90hGsyeoovEeux476arJ19X6gSMs0A5BXVAkSGKIGjcSgqjcerUkJD?=
 =?us-ascii?Q?07YSeLPVVAx28I0k4TBUjcPZfER2NoGrFjmLGEGTWHpTxYBODVjCy/BHHeEf?=
 =?us-ascii?Q?Q9Ujf/qD+nulrRG8rDWhenPOaK1LJD54ouZubYkdW3GX/KP5lkGZRZlBQqxC?=
 =?us-ascii?Q?94Pp08nqGsA0gwZladq67AHSb99czJM5xjMkasYR7yEurgKjLmykwToCd5js?=
 =?us-ascii?Q?EiOOEoEcBO0I8JgQ1j52Fypu7kR9cnIqLm6tcW2BAWrrSt5WESnB4Y/IXQ7X?=
 =?us-ascii?Q?tNvJqlsSGRFnSrkuEtCVd7JcpC1ycBnTeCJN6wpFlhwiVOjhKe6WG4yWdWSN?=
 =?us-ascii?Q?yjn+129rycFw/YxU2v3DP9GPFR0WLtM3RIjSxeh9OP6QM/ZFHt4eo6h9EC/9?=
 =?us-ascii?Q?sPDR8xhP8l6JRIdSpKfTL+Oz9WEfIdZbbOWesbwbHcMSwzIZr+WkaIKnZEMb?=
 =?us-ascii?Q?SGp9D1tcHC8jBjcwhcPQUaxu9qeHGdzutnns15F6Alyl7nzlVKwTQ+2wqsnG?=
 =?us-ascii?Q?8tw3YMlOmQstihRIcG//aMxd?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b08d59f-99f9-4f36-1a74-08d9713af78c
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 13:33:52.6400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tva8VDQQFRP8o5LavV+aKmgPZM9atXtDETVcKrl1a3/9CWLgTliHQgGwp87gzKJr9nsbDSojU3qgZNXswIQPLLye6ycOkFxxGuDLyFt5+R9bbnaAdyDKUrUMxqL6QL1m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8276
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Michael,

On Fri, Sep 03, 2021 at 10:51:25AM +0200, Michael Opdenacker wrote:
> This fixes font inconsistencies, mixing a ``text`` string
> with another string with the regular font, where the whole string
> makes more sense with a single font.
> 
> The result is also much simpler and will make future
> searches easiers.
> 

But you also lose the indication that this given string should be
replaced by the user.

Cheers,
Quentin

> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  documentation/dev-manual/common-tasks.rst        | 4 ++--
>  documentation/migration-guides/migration-2.7.rst | 4 ++--
>  documentation/overview-manual/concepts.rst       | 2 +-
>  documentation/ref-manual/classes.rst             | 4 ++--
>  documentation/ref-manual/faq.rst                 | 2 +-
>  documentation/ref-manual/terms.rst               | 2 +-
>  documentation/ref-manual/variables.rst           | 6 +++---
>  7 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> index ec43ea4a70..d57ee1a25e 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -9383,8 +9383,8 @@ log to ``${T}/log.do_``\ `task`, and can also log to standard output
>  
>        Calling this function does not cause the task to fail.
>  
> --  ``bb.fatal(``\ msg\ ``)``: This logging function is similar to
> -   ``bb.error(``\ msg\ ``)`` but also causes the calling task to fail.
> +-  ``bb.fatal(msg)``: This logging function is similar to
> +   ``bb.error(msg)`` but also causes the calling task to fail.
>  
>     .. note::
>  
> diff --git a/documentation/migration-guides/migration-2.7.rst b/documentation/migration-guides/migration-2.7.rst
> index 69bd390603..ae70353bf7 100644
> --- a/documentation/migration-guides/migration-2.7.rst
> +++ b/documentation/migration-guides/migration-2.7.rst
> @@ -87,8 +87,8 @@ This section provides information about packaging changes.
>     ``bind-utils`` package.
>  
>  -  Debug split: The default debug split has been changed to create
> -   separate source packages (i.e. package_name\ ``-dbg`` and
> -   package_name\ ``-src``). If you are currently using ``dbg-pkgs`` in
> +   separate source packages (i.e. ``package_name-dbg`` and
> +   ``package_name-src``). If you are currently using ``dbg-pkgs`` in
>     :term:`IMAGE_FEATURES` to bring in debug
>     symbols and you still need the sources, you must now also add
>     ``src-pkgs`` to :term:`IMAGE_FEATURES`. Source packages remain in the
> diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
> index c8b89885e3..1137010eff 100644
> --- a/documentation/overview-manual/concepts.rst
> +++ b/documentation/overview-manual/concepts.rst
> @@ -1200,7 +1200,7 @@ usually made available in the form of a shared state (sstate) cache.
>     :term:`SSTATE_MIRRORS`
>     variables.
>  
> -The idea of a setscene task (i.e ``do_``\ taskname\ ``_setscene``) is a
> +The idea of a setscene task (i.e ``do_taskname_setscene``) is a
>  version of the task where instead of building something, BitBake can
>  skip to the end result and simply place a set of files into specific
>  locations as needed. In some cases, it makes sense to have a setscene
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index 3af023895e..aa8fd637f4 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -1600,7 +1600,7 @@ or other tools from the build host).
>  You can create a recipe that builds tools that run natively on the host
>  a couple different ways:
>  
> --  Create a myrecipe\ ``-native.bb`` recipe that inherits the ``native``
> +-  Create a ``myrecipe-native.bb`` recipe that inherits the ``native``
>     class. If you use this method, you must order the inherit statement
>     in the recipe after all other inherit statements so that the
>     ``native`` class is inherited last.
> @@ -1642,7 +1642,7 @@ wish to build tools to run as part of an SDK (i.e. tools that run on
>  You can create a recipe that builds tools that run on the SDK machine a
>  couple different ways:
>  
> --  Create a ``nativesdk-``\ myrecipe\ ``.bb`` recipe that inherits the
> +-  Create a ``nativesdk-myrecipe.bb`` recipe that inherits the
>     ``nativesdk`` class. If you use this method, you must order the
>     inherit statement in the recipe after all other inherit statements so
>     that the ``nativesdk`` class is inherited last.
> diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
> index d3a603d4a4..f40367bd58 100644
> --- a/documentation/ref-manual/faq.rst
> +++ b/documentation/ref-manual/faq.rst
> @@ -143,7 +143,7 @@ various proxy types and configuring proxy servers, see the
>  ":yocto_wiki:`Working Behind a Network Proxy </Working_Behind_a_Network_Proxy>`"
>  Wiki page.
>  
> -**Q:** What's the difference between target and target\ ``-native``?
> +**Q:** What's the difference between ``target`` and ``target-native``?
>  
>  **A:** The ``*-native`` targets are designed to run on the system being
>  used for the build. These are usually tools that are needed to assist
> diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
> index 32658051a5..6663b8603e 100644
> --- a/documentation/ref-manual/terms.rst
> +++ b/documentation/ref-manual/terms.rst
> @@ -31,7 +31,7 @@ universal, the list includes them just in case:
>           busybox_1.21.%.bbappend
>  
>        That append file
> -      would match any ``busybox_1.21.``\ x\ ``.bb`` version of the recipe. So,
> +      would match any ``busybox_1.21.x.bb`` version of the recipe. So,
>        the append file would match any of the following recipe names:
>  
>        .. code-block:: shell
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 3a090354e0..9c6d2a51e8 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -730,7 +730,7 @@ system and gives an overview of their function and contents.
>        Each configuration file you
>        use must reside in the :term:`Build Directory`
>        ``conf/multiconfig`` directory (e.g.
> -      build_directory\ ``/conf/multiconfig/configA.conf``).
> +      ``build_directory/conf/multiconfig/configA.conf``).
>  
>        For information on how to use :term:`BBMULTICONFIG` in an environment
>        that supports building targets with multiple configurations, see the
> @@ -5347,7 +5347,7 @@ system and gives an overview of their function and contents.
>        so one of two ways:
>  
>        -  *Append file:* Create an append file named
> -         recipename\ ``.bbappend`` in your layer and override the value of
> +         ``recipename.bbappend`` in your layer and override the value of
>           :term:`PACKAGECONFIG`. You can either completely override the
>           variable::
>  
> @@ -8690,7 +8690,7 @@ system and gives an overview of their function and contents.
>     :term:`WKS_FILE`
>        Specifies the location of the Wic kickstart file that is used by the
>        OpenEmbedded build system to create a partitioned image
> -      (image\ ``.wic``). For information on how to create a partitioned
> +      (``image.wic``). For information on how to create a partitioned
>        image, see the
>        ":ref:`dev-manual/common-tasks:creating partitioned images using wic`"
>        section in the Yocto Project Development Tasks Manual. For details on
> -- 
> 2.25.1
> 

> 
> 
> 

