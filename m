Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBA00C433F5
	for <webhook@archiver.kernel.org>; Tue, 28 Sep 2021 16:24:46 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.52])
 by mx.groups.io with SMTP id smtpd.web12.1866.1632846285349891888
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Sep 2021 09:24:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=jfE+aNSk;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.13.52,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EiLXYAmosQMY3NsI5PSY4ROEiOcaMdV2EStiKH75snUKD3i0EWny3dpfazDSJONAMJHIP+AVTLhqDP1hbMWB59p04FTDs0R5ysAj4YMvsJ7t5rl1vM4V2JJSIPzvGoLdK5RPbGopjxwP0AXjCdrAfFbz1H8tdR9a4vUTjeHH7NromiJmCX/p9ByxgFKJq/I7tZ3+vOQJgG8hG8GitE1197BEkxCl5olHuLfY0uH2d6jCjnTuDoRmw520ECizMkjR/p5T/e9x/6HhA8UI+evtjaI6j/jq8by03FvBI6ne9z+oeEtpfO//tiEStd7to6TjNybODXMqARFFSxAlTfq8Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=BaWTdNZii1T4PrCBjapezFLp0HAXAF7lbCEvsydtBnk=;
 b=ErovVGnMG8vdQooOaVInVA9C0LTG6nqYxaquLfcFLbk5qhnseK0IDda38XeNVj5Wl3a9KZEh7f0Vva3Spq11nScyAiS12Hq4xF+on8eGR18lsqbFeWScuu8E77+p8G5Qi65Y0fN3LQODDlAsicYl+5a3eSgcLXRXjwIhCGcwetndLAA4mFF5pi6m/0LdaEX1rI6smbOIAv1ddTgVBFiYkup70VsuxFvv0mdzReJy5WhCn6xMI1UaGRDSPFr9WDYxnMn6Qbh/i4m50ki6fRL+2KVPFRRxesnBvUGHzS2dyeRSpVAQL1eFeHVbYuZGftqdbYM5cO2DrrFDt0aRbrZhSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BaWTdNZii1T4PrCBjapezFLp0HAXAF7lbCEvsydtBnk=;
 b=jfE+aNSk1W8YDvgVr9x/b7Byisc4UBk/1+JyOYWKYy9PLkqKQs5ApVvPSB/DH39IL3KtYm00yqiHs4dHVP2VHYrU4FFDI/in82IStqkXKpYsMSx0UDPpypxJdeTpzQfwW+fc32FAVg9NA5Eoiqo7Akhgg/w1oOBla8EBrdj44ec=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB3987.eurprd04.prod.outlook.com
 (2603:10a6:208:5f::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Tue, 28 Sep
 2021 16:24:42 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::1d01:cb7d:b647:46a4]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::1d01:cb7d:b647:46a4%3]) with mapi id 15.20.4544.021; Tue, 28 Sep 2021
 16:24:42 +0000
Date: Tue, 28 Sep 2021 18:24:40 +0200
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: docs@lists.yoctoproject.org, Quentin Schulz <foss@0leil.net>
Subject: Re: [PATCH 4/4] docs: sphinx-static: switchers.js: redirect doc
 series links to latest known dot release for given series
Message-ID: <20210928162440.7pgonmmnec5vv55e@fedora>
References: <20210928162202.749990-1-quentin.schulz@theobroma-systems.com>
 <20210928162202.749990-4-quentin.schulz@theobroma-systems.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210928162202.749990-4-quentin.schulz@theobroma-systems.com>
X-ClientProxiedBy: PR0P264CA0213.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::33) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
MIME-Version: 1.0
Received: from fedora (92.42.140.82) by PR0P264CA0213.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Tue, 28 Sep 2021 16:24:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e8c24ee-d18a-4cc3-9434-08d9829c79ff
X-MS-TrafficTypeDiagnostic: AM0PR04MB3987:
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB3987FE8A143BC2B200100F90C2A89@AM0PR04MB3987.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:462;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qrXFdVR1/jQgwG1NSgEKz+FCxVp5ZI1zTpcanGquxNEdSh4brQxDDdYfT07+mOnT7CLNm+mAeUGeThJG38XdxVMtdqwjY7k9tXMMq+j7TmUqMqXIHVTBpTqrnv0a7M5DXav56d1cRWj/MvbljAW3ts30aKZ9XwLWLXhYzj4+uDluaEZTCOkGNN3mklCmOZpXeKrz4gVM7JsaNK5uNw8Jq+nv6CUVQHvr1zO4ERnMjuTLitCg57Ii7Uc+QS/ydc7Cz8T1oBUxqiR9tk7fXczjARO10rWEjLNMOtwL2jVIil+U0LKAj/uaFpb/Kjlt7CPnaxrtma43S9Fn5g+8/A7G6CqTdTq29G/ErYYcCplOSOrZWOGrdC/cAlPY1/Yfl8pwJjjNy7NlnEC5QsyHaZ7sGfoYowoTHwMnVVKFcN66f77CNrwwcjDVQonz8M7wVn/jYuxTVAFyWERZB/PMh07v+La+n89aKFuJwalDxbOgKxOc1BGfyAkc2mNxwUIc6pWfOmu1sX4LNgk2n4/q205KWgn/4UpfDCP4p6HWU0jxw7VBNjjB+myZG6IHT1sdtwoLqOqKnwjHLJnIo869m6JxVHp0LmMH0zffgAxrnhVMDtHMwHGPdoTFCEfB/u+0g/n+l4YDt70MOGSq0ZM0pT/JuNaXfVFQT52NdedN85abzEVu3HWz/pvc8caLcxQmjpLHKSj6MLx9JsbpF7f1ZLziNvliyS9PD/PEC5X+wCV1urI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(33716001)(316002)(44832011)(38100700002)(38350700002)(508600001)(8936002)(9576002)(86362001)(52116002)(66556008)(6916009)(66476007)(55016002)(9686003)(956004)(8676002)(83380400001)(1076003)(6496006)(2906002)(66946007)(26005)(5660300002)(186003)(191535003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fLZ38BXepIX5txR0XhlMPh4sJxBBgYm2ZfdUIeS2ItFFTq9/Kl4kR8HUEf1O?=
 =?us-ascii?Q?JrFHFIttZYpcZTfr3d7vdDOiuuvwOAzVVBExrnl3v9JbP4NKlyjZoW/yRoHN?=
 =?us-ascii?Q?D5AJOrYOkGZesMXcYS2kBs8aGUabutMg9pQWsqf2iY5rszr9dTwi5TeC1cKP?=
 =?us-ascii?Q?SqcIWKR0gzIdwFcvBozaiU2GzsTKnMzPCjcFLCoc+MrDGfu4/Lf3ZKtmDDCF?=
 =?us-ascii?Q?FrKf8iYp68p5Fa6o5+XL4B8H2KZJDVDmgVH02/eLWTI32WOSDX5vIGMd7lYD?=
 =?us-ascii?Q?oeLH7yco4+2Ohc6KMGGsep2tp0xxgBP8vpivUA6kVrKeL0OA6fAoC9W6N1n3?=
 =?us-ascii?Q?ouYkOvyJAmdrQscmHvBSqj1joD7zcGmsMz342SUgsZMcfA35obSbDrHwKqCc?=
 =?us-ascii?Q?H6iwaudYdHDAe/2H6EYerK53X1VbXZRCNYXMRBI01r3Ez++3an+IjbULXu8/?=
 =?us-ascii?Q?29v9BWraOnE+augVUmcgjQyCq3oy8YNRBK5KUFroq238zozDm4NQ6r8yY3d1?=
 =?us-ascii?Q?HyilrMlb243tVuclmmFk6ucxbIC0wiKzyDTuXoa1dDeMS/YAZDRTEtoCSRE0?=
 =?us-ascii?Q?QWgE1je0PbB/+4rZSc5aHWNIzjftpFJjjrEOYNrn3glBsnxh+bcupK4t1Kmq?=
 =?us-ascii?Q?Vs4hrystk6KZq+tdRhNzE+X3MJ7iXWwfr5lyw9YB1FnAFYXlHwMknrbpLIIA?=
 =?us-ascii?Q?J4oJlKxWOuClplWQ/RRaYp34vloumOBs3ARLNkPx+G1i2PJXzeVZfVg0X9dg?=
 =?us-ascii?Q?XDg9bt9slxr3HBTsng9Uu5EQvFI4q4xkwTBX/2yFzofppB9rf9g+bmDDxkob?=
 =?us-ascii?Q?3T1R0aEKgVni2aVjG2H9PmnkRFpe9fAab19SkoiwxQ309Bp8qJ+ECnrcTotM?=
 =?us-ascii?Q?lviR3Y3B3VoP/EqcBc2vXWsIf0d5E2NXcSa8C5VC7JnA2vBQoZ1Fzb8iTo0V?=
 =?us-ascii?Q?Y8TtmryIpzI+CjiSK7vGmPVRq2Qj41fuiBt5dRhhmx5MDyNtgSxn6QyZUeeY?=
 =?us-ascii?Q?01ratYYSNwRlhNAtI+VvdRduruy+/gLEWpGrFs939bISrfn+k1evJvJ2CLEW?=
 =?us-ascii?Q?gByaCroSOhwejMbACF4mgRBGMWdq1Nj7n73TyoABKPjDTOct67hyhwKQmvDv?=
 =?us-ascii?Q?gWEM54EAqtAojQZDijW8Zq72ZKkX2fbBV+Ip7g5Z53VFxFG3pyFYJjXdPWS4?=
 =?us-ascii?Q?m3fbQowUhncmNITmztqOyqlllbh0eVm2UDIfgPdPbPZ/ROZ0cFk9F/DJWyg6?=
 =?us-ascii?Q?d/hJhhwOVLPoeq1bMdbSL90NFzMyR07CpUyOc9akx81Rcn64/VjNIu/tAhiz?=
 =?us-ascii?Q?I9EhUffC4KGDrB8FD4+pAuDL?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9e8c24ee-d18a-4cc3-9434-08d9829c79ff
X-MS-Exchange-CrossTenant-AuthSource: 
 AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2021 16:24:42.4296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 vDp5FZGguAw2jCEz7LpHyXkOL+VajVM0VvQq8xKpwYIeuvaSk1qAeeVLWVFRDxCJurfAiLWhSWcucK1Ria2UOjcSByPExXrVtx0JwzAiQesnGuu/FCzGnOks4AVYSNXb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB3987
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Sep 2021 16:24:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1903

On Tue, Sep 28, 2021 at 06:22:02PM +0200, Quentin Schulz wrote:
> This redirects e.g. 3.2 docs to 3.2.4 so that the docs are always
> up-to-date for a given release.
> 

I realize this might be a "bad" idea since 3.2 is basically 3.2.0 for
us. So sending this patch anyway just to start a small discussion?
Should 3.2 be a "meta" tag in the docs and have 3.2.0 instead of 3.2 for
the first release of a... release?

Does any of this make sense?

Cheers,
Quentin

> Cc: Quentin Schulz <foss@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> ---
>  documentation/sphinx-static/switchers.js | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/documentation/sphinx-static/switchers.js b/documentation/sphinx-static/switchers.js
> index 35b9a8c81..0dc947ea0 100644
> --- a/documentation/sphinx-static/switchers.js
> +++ b/documentation/sphinx-static/switchers.js
> @@ -238,8 +238,19 @@
>        $.each(all_versions, function(version, title) {
>          var series = version.substr(0, 3);
>          if (series == current_series && version != release) {
> -          $('#outdated-warning').html('This document is for outdated version ' + release + ', you should select the latest release version in this series, <a href="' + orig.replace('/' + release, '/' + version) + '">' + version + '</a>.');
> -          $('#outdated-warning').css('padding', '.5em');
> +          // Redirect 3.2 to 3.2.4 but not 3.2.1 to 3.2.4
> +          if (current_series == release) {
> +            var url = orig.replace('/' + release, '/' + version);
> +            $.ajax({
> +              url: url,
> +              success: function() {
> +                window.location.href = url;
> +              }
> +            });
> +	  } else {
> +            $('#outdated-warning').html('This document is for outdated version ' + release + ', you should select the latest release version in this series, <a href="' + orig.replace('/' + release, '/' + version) + '">' + version + '</a>.');
> +            $('#outdated-warning').css('padding', '.5em');
> +	  }
>          }
>        });
>      }
> -- 
> 2.31.1
> 

