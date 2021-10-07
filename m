Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F084C433F5
	for <webhook@archiver.kernel.org>; Thu,  7 Oct 2021 10:59:14 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.52])
 by mx.groups.io with SMTP id smtpd.web08.10058.1633604351649826801
 for <docs@lists.yoctoproject.org>;
 Thu, 07 Oct 2021 03:59:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=LFa/BDnU;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.2.52,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RrEQz6ry70DMNCoCm+Aj0d8YUHn5yI6xxpgUFIj0O2OMgt4///bmPA4e9mM8t9yC5toTYu0qMEODvcLqD1iwjnWFcin87F1XP51VQcpPCoXywRHKA1dzQLK8yeZmjni/CGYjRVUv+d2Wnxd+kLh8g1hoD5Lo+ey9ga0eyJsSa4GXD7e7fk2Ubji7Q/FGRps1lvkzScany82acTzi4MvBrAO8sWebOthbQr5wUlaVK2jHAuojiKNXebnJTmLysOh416Gkg2/g4i3WwzRAknxOmsVjv4HsOW5LOXlrAnVX7ME6WUOq3tLAx2WPjEMJ/5KgJ98qvMQxZ8HGriRn+nqXrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b1lqbEjpPskHRlbkrf0XXSHNrLjfi0wAw82NyF1wuB0=;
 b=M5Lyhl25hyQNByeljT2l86qkluH8pF39vrV54LwQ4tq13y9MD1SivmR/H9O1VQUBNLGxKAhxoHyc0TKGOqmwTWvWuVGaHkw9UMeRaMWpEus0DePzRFbJT2hrJe+smVsUy6LBVEHxU/TB9Jgt4bm/xh8ZqBQ39t/lphXpV/3B42QSXIVGjrSlV2HEhM2dJGbtMkjbD8cyH8hYHrQ5ZULQHb+cmvede+7z9xsye01/KXv3oAYUAJtvaVYIngxCb4MX0R6dahtGqHLy9utWhyLrR7wXhmvrpgMxjhYq6qNPYq4WWKyG4WTOID0waEXjFC63QNm0mkJ4cQK2pQuwa00HVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b1lqbEjpPskHRlbkrf0XXSHNrLjfi0wAw82NyF1wuB0=;
 b=LFa/BDnUQxk+yMgFHDFJEdlA9lzWrjbyC405b72+psDzUw/JdBCCY1ga4MQ7WdaeqY1t5NwpbiSVnUvXbbNBRKO/001mpK0PTcOcCwj9I8FxuMiKHUDpSd3TQ8mvFZZghQId1w+k5CpxB768+L3S/VBYT5PknlRWAc3h9jJ1QPg=
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB6449.eurprd04.prod.outlook.com
 (2603:10a6:208:16f::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.19; Thu, 7 Oct
 2021 10:59:08 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a%5]) with mapi id 15.20.4587.019; Thu, 7 Oct 2021
 10:59:07 +0000
Date: Thu, 7 Oct 2021 12:59:06 +0200
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] manuals: introduce 'yocto_sstate' extlink
Message-ID: <20211007105906.feddo47g2sq57ksi@fedora>
References: <20211007094438.989124-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211007094438.989124-1-michael.opdenacker@bootlin.com>
X-ClientProxiedBy: AM6P192CA0066.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:82::43) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
MIME-Version: 1.0
Received: from fedora (92.42.140.82) by AM6P192CA0066.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:82::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Thu, 7 Oct 2021 10:59:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 754b2d95-0e3f-4e5f-1577-08d989817c38
X-MS-TrafficTypeDiagnostic: AM0PR04MB6449:
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB64498F719A6B206B54B6B2B4C2B19@AM0PR04MB6449.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:962;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uf7l7MR4m6/4D2N0sJjOYSeso1pUKEIAsFVx+wZCoDJt5nwzKMnmj906eXI1IWvHpg71bnMMKyeHFky56WhkhKexmCW1MVuUvsFh/jO7cR/zGB5y6jIDA7hFp2//phzXIk7c4+d0rFD46K//IZ3L2hSRB9rL+OnPLfn/KBpS9FP2GQJ2SvIj2s9kvVFYCjHbpc5ilVK8s1vPqtOrDfIh+6tR5panVjP9VORHnwHRgrAd1P29zm0+UbpUJngwcoADLH/VXwSsxmYMPBIKGQfguF6J0qFRkf7+LPgS1LOcjZUUGgfEE2IMQKkBgoS20I0cT3S6pnvMWT0pKRdHyBE731lFNUjvSkFaMIkEbGirL6AFyF0Pklq7dN1K4hS1YPcI8j6UFiWA5qyvZKb+2eL8hvXQTtg4pK6P2tkFHCitmxNCCYZcT7LrFb+ZW5GdToVSc/sse2nUV2flf7bHTlXKUoDApBlOuxxRR+6HVULyKz6p4vs5H5wES6D2d4gWCB/IWrbsnXoGyRiXH7mo7QmMF2fJpjyobXq3LE3iEY2RzkhfT2igK27wuI+Olb5PYxxUVUP3A+wggCl4PMgpk0LSrakjUaEHGZDVMu5FCxSpXUN/tY/KR6ewo33ABa26S1Rd4N4FUJt3J9uatMbnhUxKj8Fo3aPnzc9FMM+6yx8OxfbcQGGzV5JiTNTTd3NQLdbbuxJ0qa0OobW9isio4eJt48lOPFFSxwnlx8fdUBPSFpN0ilxU+mjIyomd8VHaJ7MpjDUh4Bleiez7nUJ3GaLySc7f/eWo2TTVuXekQdKwcORvGVBmWbYsaOLQfGuubfUx
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(38350700002)(86362001)(66476007)(6496006)(52116002)(966005)(66556008)(186003)(8936002)(1076003)(33716001)(44832011)(9686003)(66946007)(956004)(316002)(9576002)(83380400001)(26005)(2906002)(5660300002)(4326008)(508600001)(6916009)(8676002)(55016002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?L0S2J635s0kwfnB6CP7zFyxvd7GTJNr8q2WJNM2JJH3M2luwZZTEoo2PFu2X?=
 =?us-ascii?Q?3gMEdOWgzv0zVNa0tG/Y3mMr5HWD1yXTEXsLKCxEdTgmxbo971VZuo3bbsAa?=
 =?us-ascii?Q?4eKdsuRl8KiL6JXjKJfx9Qzt+BJpkF49TcQi0zUOUkwJu8lyQiGcUhxln8YA?=
 =?us-ascii?Q?9UQcptsSYXhYYXZUlyJ3+HQXv83KKcYe0ANef58g0mUT/zACMfL1wXuMaq5w?=
 =?us-ascii?Q?cuGxhoDjf9/HOG2hu+QuEbvg9i+yGj5o7Xc7Pc7jP8wUc/zLeMnJyiAp+3lt?=
 =?us-ascii?Q?E2JR+J2SKowgFx84BlNH/ZyrZN8x893RlHFh+4O8zKXiAosDQ8Bl/8Nt6E2r?=
 =?us-ascii?Q?lOg1Dmnr2I8Y2W2EuN+mk2qijDewiuZ1jypLWBvlY8XGR1BXXTdwO+wGCRlG?=
 =?us-ascii?Q?y7eZOpWoQdZZr/OmCgzVpxDvmhVVRuJW1HPoSU20u5E/PV1YxEwRBUmC7FMN?=
 =?us-ascii?Q?vXSVuBeEnsLauumS7WTdrO01dUVoecxNAcX0uMZWYROV6k3298uhqsayb3qR?=
 =?us-ascii?Q?8yT5oGq4KAoOzA5ifT6+8gQTQJonCbHmZrL7fk0LoiV9/qwbMuz9PCJvR0sV?=
 =?us-ascii?Q?/AyBOSMWAWrQgEVoRRvhtUc/drVU4XI7Eelw2vWpH4Zk/pOW2zQT3QmSv50v?=
 =?us-ascii?Q?9l+quBN/uUjZEt9JokW5cPqipWFL62ilUA0Ceo1rVHMwrWlJpdGRgauxrwdl?=
 =?us-ascii?Q?oEh2wGusNi5USqY+R2K72korYJRbc5Ci23I89/cX5ANI3KMcQXz795Y2TUzv?=
 =?us-ascii?Q?nZfVBv0NXn2xZH3bnHHYxjjuM5QQijSTqjucdYI4dvwdLnPZytp2/NwhiZhR?=
 =?us-ascii?Q?Y0bVc0ipDA5uXi7e7PVjbSLtimiXcBb7QiWnQP1IXB8ZtbtGF/9V8DeIHqc0?=
 =?us-ascii?Q?MqPnmcjk+eUI5vGdDzXyNZJ6Kn72pYTuIrGW7nzmUvzzI9a7IdiIc8vFN9Wn?=
 =?us-ascii?Q?J3dhe0t+NMGijqklr0dkLRRYxRuTII0NsvT5I+emd05/D9TFSl4ZeM5LqGK1?=
 =?us-ascii?Q?YUy2vFDZyXlTKOG7P82CIbU74FSG12X77PjYVJsIwxN7ghrK8rCIwEm/b2EG?=
 =?us-ascii?Q?EWlippp7F5nroC1mPUnTstXNPgYnvQ/i1dM5/tV1HuEPs526sz+VQHhWZuzE?=
 =?us-ascii?Q?ZbquDufiD9YiAXMKtFMY/URljeRvpb5DS1c1I4+K0SMRo+VrNvfgj1oC5vvm?=
 =?us-ascii?Q?8Z2R2Zz6qerXUPdKnEMlwyhWKRZIZ0B2PnIUIkyBqCqb7PT6xJ2viAP+PhQX?=
 =?us-ascii?Q?dXK6yKGa5DBt8FQEfV0+SVmEVnV1z5vIqshoQ7UQkrfgccbisVxCxRVhlPfB?=
 =?us-ascii?Q?6s0pwFP+1vioG/K2QtZ5gtPr?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 754b2d95-0e3f-4e5f-1577-08d989817c38
X-MS-Exchange-CrossTenant-AuthSource: 
 AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 10:59:07.8332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 fQyIfe900fbbK9FOWP/ak+JXRgcFZmNr9J/7nEKZxdWN5xM1VUswYVcocQ2Nlq3UUEoKS9m69CyIbz4/bie1EKPIW0ajvsopkI2E9lilMPq29aPpGlNhDGORjhFZmFAZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6449
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 07 Oct 2021 10:59:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1943

Hi Michael,

On Thu, Oct 07, 2021 at 11:44:38AM +0200, Michael Opdenacker wrote:
> ---

Does ^^^^ this not break the patch when applied?

Otherwise, same thoughts as you, not sure it's really a big improvement
:)

At the same time, we could think of enforcing all yoctoproject URL to
have their own extlink?

In any case, fine by me.

Cheers,
Quentin

> 
> I agree it's not profitable yet, but it may be as documentation grows
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  documentation/brief-yoctoprojectqs/index.rst | 2 +-
>  documentation/conf.py                        | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
> index 74167befad..666fe4c4ac 100644
> --- a/documentation/brief-yoctoprojectqs/index.rst
> +++ b/documentation/brief-yoctoprojectqs/index.rst
> @@ -256,7 +256,7 @@ an entire Linux distribution, including the toolchain, from source.
>  
>        The previous examples showed how to add sstate paths for Yocto Project
>        &YOCTO_DOC_VERSION_MINUS_ONE;, &YOCTO_DOC_VERSION;, and a development
> -      area. For a complete index of sstate locations, see https://urldefense.proofpoint.com/v2/url?u=http-3A__sstate.yoctoproject.org_&d=DwIDAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=MK-Syqeqx_J_bPB3Dh5GlffdTeMa_jqr79_Zfzm0VPk8g9jgv3CEAbIcCh6hmzJv&s=XAxzis6i756AHz10Lrohd6bcvHSI-WOipkCqf5WLCWk&e= .
> +      area. For a complete index of sstate locations, see :yocto_sstate:`/`.
>  
>  #. **Start the Build:** Continue with the following command to build an OS
>     image for the target, which is ``core-image-sato`` in this example:
> diff --git a/documentation/conf.py b/documentation/conf.py
> index 8e15fdc869..4c3487dabf 100644
> --- a/documentation/conf.py
> +++ b/documentation/conf.py
> @@ -79,6 +79,7 @@ extlinks = {
>      'yocto_ab': ('https://urldefense.proofpoint.com/v2/url?u=https-3A__autobuilder.yoctoproject.org-25s&d=DwIDAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=MK-Syqeqx_J_bPB3Dh5GlffdTeMa_jqr79_Zfzm0VPk8g9jgv3CEAbIcCh6hmzJv&s=lZepPYrIHiidL2BUgYQkKF-cleYBVCCJXu7rIM_LCH4&e= ', None),
>      'yocto_docs': ('https://urldefense.proofpoint.com/v2/url?u=https-3A__docs.yoctoproject.org-25s&d=DwIDAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=MK-Syqeqx_J_bPB3Dh5GlffdTeMa_jqr79_Zfzm0VPk8g9jgv3CEAbIcCh6hmzJv&s=r0igCKw4nxfdwsyy8_X3uustJhhWiUh8OreD7bALk7g&e= ', None),
>      'yocto_git': ('https://urldefense.proofpoint.com/v2/url?u=https-3A__git.yoctoproject.org_cgit_cgit.cgi-25s&d=DwIDAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=MK-Syqeqx_J_bPB3Dh5GlffdTeMa_jqr79_Zfzm0VPk8g9jgv3CEAbIcCh6hmzJv&s=ccP3kr5v5ECvgpqvY-wy5Q18so42Z9ueQY6UIVXmudc&e= ', None),
> +    'yocto_sstate': ('https://urldefense.proofpoint.com/v2/url?u=http-3A__sstate.yoctoproject.org-25s&d=DwIDAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=MK-Syqeqx_J_bPB3Dh5GlffdTeMa_jqr79_Zfzm0VPk8g9jgv3CEAbIcCh6hmzJv&s=VYNHFQr8_fmBItCSFtXDpDgg1F6pKxneNRWO0FadWsc&e= ', None),
>      'oe_home': ('https://urldefense.proofpoint.com/v2/url?u=https-3A__www.openembedded.org-25s&d=DwIDAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=MK-Syqeqx_J_bPB3Dh5GlffdTeMa_jqr79_Zfzm0VPk8g9jgv3CEAbIcCh6hmzJv&s=5dANCSu7CQ_vDzDfIJckn56xPbqGYVPxY_JmN5Z1p-0&e= ', None),
>      'oe_lists': ('https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.openembedded.org-25s&d=DwIDAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=MK-Syqeqx_J_bPB3Dh5GlffdTeMa_jqr79_Zfzm0VPk8g9jgv3CEAbIcCh6hmzJv&s=F5zbTB7qvF27uqTfgoZH9zaCN_mhEzqmJ9JV0LJftVA&e= ', None),
>      'oe_git': ('https://urldefense.proofpoint.com/v2/url?u=https-3A__git.openembedded.org-25s&d=DwIDAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=MK-Syqeqx_J_bPB3Dh5GlffdTeMa_jqr79_Zfzm0VPk8g9jgv3CEAbIcCh6hmzJv&s=1Gr3SB0S-nb6YmplOEVyF7W-Aco7e8UCGAvFfNCkSLY&e= ', None),
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#1941): https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.yoctoproject.org_g_docs_message_1941&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=MK-Syqeqx_J_bPB3Dh5GlffdTeMa_jqr79_Zfzm0VPk8g9jgv3CEAbIcCh6hmzJv&s=PZfjvCiM8lip6VahFSYXixMOOunT5_taVMxaN1Z3ECM&e= 
> Mute This Topic: https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.yoctoproject.org_mt_86140968_6293953&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=MK-Syqeqx_J_bPB3Dh5GlffdTeMa_jqr79_Zfzm0VPk8g9jgv3CEAbIcCh6hmzJv&s=66lWZTSxFLQv5BsPMaSV9trWKl9CY2j8bWt6L9v-aQU&e= 
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.yoctoproject.org_g_docs_unsub&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=MK-Syqeqx_J_bPB3Dh5GlffdTeMa_jqr79_Zfzm0VPk8g9jgv3CEAbIcCh6hmzJv&s=vJlSN_PMnc9Umo2h1tvuxIn9cEusbMeiDrDJr0YWGnE&e=  [quentin.schulz@theobroma-systems.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


