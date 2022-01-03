Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42FC6C433F5
	for <webhook@archiver.kernel.org>; Mon,  3 Jan 2022 10:54:54 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.53])
 by mx.groups.io with SMTP id smtpd.web08.26407.1641207292476893507
 for <docs@lists.yoctoproject.org>;
 Mon, 03 Jan 2022 02:54:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=bUzQWz8v;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.8.53,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PRiyc5dEZqDsMEQ8SNPkdWSNPfHS0EMmS5suow8GQVqACAwVTrDSqmDpwoTMQ7Sku5h72zqPCNvOZiDLeHEdGzmK8DogQXZNHS/eANOIduxE+/q8AjOnh9kIOdBIYGXvsvnAmWI6CnL44149XnRKLFCXn2XHmUE7w/NAAx7aCv3vNwIDqs1yIQBigtgopJ23khWAJp+Zni5ca8gU8a7AgnjPo8DnjRBPVckIpjqvDMzjTN+mvUHWwLTo2r8y98gusPzREC8rbHof8N9ip9eQZ1KCdU+XGh3ZHuVoH85JyDMXxSoh+sLoImkil5rzHjQsiAmhFoVR8PMlI6MprRhxmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2VRkJRPiRsBnxGQ1rE18G7Ne8jy9vmrdxwuNRZ/iDLs=;
 b=TeNM5L4w5eqSzVtNX+7hNOh2A3vhvWzNip0J7TOkFhQywpt6ebmGw0zUIJTNzZIv92m+ZYB68vPGAKuSpowAm4kJI9C1SSZn00NBXyZwWk7u5ww0NNd1e92kbVZ72cSGgeAUM4W3C+9Gt5UEcPUyejX2jFCXY1IKqDQDCsQA0PYYwMWorluEghnktbgg7daFN7vHGNpr6ZO5mdd6y1uu2RN9GC+jpDlUoWDqUy/YY56ffI8STRuvphOlzps9W6Dt3vyzE1SuPZ0oJAvdSqhWIjVoAsbp3j9Xmul/8cAFFxR5M3N/v4HSLzqmZwGjoGMPadm7gvIjeM3DfhmBKU4UEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2VRkJRPiRsBnxGQ1rE18G7Ne8jy9vmrdxwuNRZ/iDLs=;
 b=bUzQWz8v3ih5bpS77NSWfam307hzMCOU1KgFQWH78ST6K2VsemBATHVDEw72tl9aGzdQPUV4+8T+DZnEF84vd5Erk3RGf1jbjsTSo7dHUaPKGpyCV1DVZaOoS5Hgu0FJ4kTo/onDWQVNHQlHEDFPpxfzke9ywKWRE6gjPWwvM3I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by PAXPR04MB8591.eurprd04.prod.outlook.com (2603:10a6:102:21a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Mon, 3 Jan
 2022 10:54:49 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::a8e8:87d3:e868:cc93]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::a8e8:87d3:e868:cc93%5]) with mapi id 15.20.4844.016; Mon, 3 Jan 2022
 10:54:49 +0000
Message-ID: <d71de2bb-760c-f870-fcfc-6d077aff804d@theobroma-systems.com>
Date: Mon, 3 Jan 2022 11:54:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [docs] [bitbake-devel] [PATCH] doc: document override style
 operators not working for task dependencies
Content-Language: en-US
To: docs@lists.yoctoproject.org
References: <20211216152555.815291-1-dwagenknecht@emlix.com>
 <484FA2CC-02D8-4368-B332-DCBA4FBDE61F@0leil.net>
 <424e25b0ebe9283e60c5d8983368b346ead16963.camel@emlix.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <424e25b0ebe9283e60c5d8983368b346ead16963.camel@emlix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: VI1PR08CA0197.eurprd08.prod.outlook.com
 (2603:10a6:800:d2::27) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31594933-1d1b-4b73-7619-08d9cea77643
X-MS-TrafficTypeDiagnostic: PAXPR04MB8591:EE_
X-Microsoft-Antispam-PRVS: 
	<PAXPR04MB8591B976C6AA95B352B5E038C2499@PAXPR04MB8591.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mHbKsHOngvdEoBBDLb/ZeM3D+THo1sMM5Q3Vi9ilrYjaa/GxsuVUyMujUeoZX0f9hXEppRulx0aU2qQhqQmXTpTiLJbl3yk1yI1DNy/rP1RWFi5PpRhcKBnGHHJCCGYInp5Y3asBENbHWs2AyAL7heGWH+gJ81TWxMjH13iYKmZcjAKayWqr5DA+M4Q61VpQTGTaLXsmHX5KlsBrTgHT1iCgITGYTzkvc6o2iJNL1rksZi/sgaRrmWtW30Us4LzSp848JpCYasbrxEZHK/8AMKNip+9zwd0xlkf4qDE4iaeuB1kZWzZ1x6tmbb+IcRRJwFF7uUwNMXj5eb9MLGayLIpdG9IZlDp9s1NjP/g06ZW8v89oB79WUsgEBZk0YheS8wntUm3hvgAOsMo4u7C82E1E+EvUwaKz1eHttLm0naw6T0gSxO+OiN8BVl8+r5t8kx8RZQNktfIPtNA9ovUp+nw96+wDqyq7YdqX9tMhdpKfijaJ+Ce3y3S2kK0eXHkmMVxdeOPCqnanLyeqdss7YnbVRBc7GKkEUuHbPy15JX+Kg9v62unPsjgtJsjTILV2TVnztKv1oxpQtESt/hzMmluPScyZNk1X5+z7OuGVJL/bU/ea0tG94pVdlogjFsr4JcsDymdLnJZryXJuG2cMWpvyqC3vH3SYW5sUI+AHlOr90bd3CR5rmDpXSm3ezzyOYqx9s5ltWfVP/1kwDSKb/7yBydC4MmARXwnsgI0v4oKMdqiovCXR5CX11C+h5IhEf/9r8+vKuHSvyScAg9PlCfILyh0tSZThNYtnVusHmEZeqnBHmJauyN3AYI8/wgqx
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(53546011)(6506007)(316002)(6512007)(31686004)(44832011)(36756003)(66556008)(4001150100001)(31696002)(83380400001)(508600001)(38100700002)(6916009)(8676002)(8936002)(966005)(2616005)(86362001)(6666004)(66946007)(186003)(2906002)(5660300002)(66476007)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BpeHg4FytNVdz6zc0nGqz/yvFOMPNl4B40gBP5uKij3thWRjLZZvNAmNcqZT?=
 =?us-ascii?Q?y2/fRFXLNnH811dgI40mjK3q1wPJUhP6I9RbAvKkCym+THhwbu77+KcsOGKr?=
 =?us-ascii?Q?/ezIEFYkrj4neJnomUz1OxDmQLvYtHi29zW8ijwnkElOodRIgh5MUwryt+j/?=
 =?us-ascii?Q?ZJGeKHghe082iKbULq14fipXhZbo3o1eB4XRsiHX0oGH/IwatROhhg7aRu+D?=
 =?us-ascii?Q?NqIp7NIBuw4HauT8HgRAsIFTx7WwZthJSiULFgy5OpJdLweQvWfZ/4UjmzHv?=
 =?us-ascii?Q?ndP71yY7pcW1cvTJYV0+27Vuzm6SYux0XYDLH3fXKrDF92A2dkZtzPZGPmeG?=
 =?us-ascii?Q?O/AHFQohvfsg5kPeIgwCmp1ijdwBRLildhqzUoefp8duiijfqfsCb0x7bIls?=
 =?us-ascii?Q?P8EE6OlvnhLiIZK7THqCuNa9uoHzUYAiJyi4nfGBin7+8sBy5TXfb1SQ4GyV?=
 =?us-ascii?Q?QQSXL9EaXFP2I1FAA2AgcYeWjRq73BMmTU37jCic0xtHobRNYDl/zWAZdBNv?=
 =?us-ascii?Q?Iv+B7KnQt+eCmK0uo0+JD2vTr3HGbYl99/EuVSyVmyzrstoUJpVHGtDELMtl?=
 =?us-ascii?Q?eSIXmXZY95Rm8VeNCoSGMODZYbdufJ+RAnWmbuCeYUZRZ+We4RsqOwM92B3q?=
 =?us-ascii?Q?0eP+QqQJJ4hzSHKEyixzbDJBUmIV5RDWxqhJFkEDKuFHG9MAw6zPWELpVXYc?=
 =?us-ascii?Q?xH015QhnRknexW+IgR6VKGs8FIuTEo/LW+uEcKvk8M8790fqLsqEIhIR1Ewz?=
 =?us-ascii?Q?SHOndCWK5fHx/cFJZNre6Vaa34DqxRdNiZ2iuFQBgmrp9sFjLsaBwbFIFqop?=
 =?us-ascii?Q?p4WOzcY/1UI091ti6MnAsRoe9XCq1VDcSUeWRdrcTCSP4TyJZr892dZx2Of/?=
 =?us-ascii?Q?///Kp1K6yVbYkf/SRcu27dobGA+3rwG6NNITm70mNCYSwOnIVet9cyoOaZD/?=
 =?us-ascii?Q?mOhqzAbftBgrXBXNFWj6q2BjiYNiUv1+fPa8NzNiaxEi2iypSr/zunxV33d5?=
 =?us-ascii?Q?d8pKXt25RS+7gxW4POVFilH2/ZUruSoCsKCo17WIeuWBKQuZDKyvUnyL6yDJ?=
 =?us-ascii?Q?4/7FC/eJ4htaFt7gn4Dx7Y40OLTKzVq9kN77uFwjZwcaZydTUmPBxIyBygDM?=
 =?us-ascii?Q?wChoQh8J6LYOPF/NfjRy5U7NX6YX7vKpk+6D9royIh3VrIYOCHWrJPRS5V/j?=
 =?us-ascii?Q?JmWa3ybWQPDk/LAu9S97MDsX3pmK5c8Qh6Xn8IjkgsjeIOy9iNwWJ+CDkQOJ?=
 =?us-ascii?Q?QnCr9jbs96obBZpffWETjyHQkvzrlpkWzsZmrtcsMTAlYVpDHSYsFquE2sHU?=
 =?us-ascii?Q?IynB/WcNaDcPu835peMjxWcZhVhF5bSlPiM1SinuvnWyJtLApJXXexXbEZ5v?=
 =?us-ascii?Q?CtG0YZVY9DjyLPIf0aOYXnLDWN78GVAKhuuFGECfnBPhOfkN7My1IzzkcKvs?=
 =?us-ascii?Q?HU0gQYc3aGSd5aedkbHYtD+ClCW2VPrFsM522VNcgtl6yLs32DEpcFpVTUJt?=
 =?us-ascii?Q?jk5VJJTIOzJg4xb5c5EJ2qnonoZHOYEmqPBudJbmQ97/xuIfxw3B5Pj3X8N2?=
 =?us-ascii?Q?9VZOJamEKJp7FI1xizR9gtDLLSsZR3LujIhgqz5vw3qzQcwTl+NNFA9IXGFM?=
 =?us-ascii?Q?JX8ww956TP9Urb0sXaFqVmW7iuNKfGTaEMYExqiQik0G0e7RvvfY1BRRx83L?=
 =?us-ascii?Q?UR46lAxUPs+CYuLFqcZKrEegFHZkUs9bbfRcwma9Wex09WxAp01XtzGnT0PR?=
 =?us-ascii?Q?8jkJdW1HjiFWOTUVsYZnhzVeHzGmSVo=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 31594933-1d1b-4b73-7619-08d9cea77643
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2022 10:54:48.9566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 w8mGPXZxbkh4okX8ZcSXCG9GTMqyT0nA8joz82IKYPiJGXJt5zAMs80R5/ldpmD3kL5ea3w9MLNKacxUk9uDMx8e6oMPoxVrMQAG2vFTs/xRGEMYu1nhB9VhB/1QWmFg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8591
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 03 Jan 2022 10:54:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2328

Hi Daniel,

On 12/20/21 09:06, Daniel Wagenknecht wrote:
> Hello Quentin,
>=20
> On Thu, 2021-12-16 at 18:14 +0100, Quentin Schulz wrote:
>> I think we could make it even more explicit by adding a section in
>> https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-m=
anual-metadata.html
>> to explicit incompatibility between any OVERRIDES and varflags (or add a=
 note
>> in both sections that it's not compatible with the other) because I thin=
k
>> this applies to :append and :prepend too.
>=20
> The section
> https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-ma=
nual-metadata.html#variable-flag-syntax
>   already contains this sentence:
>     All the standard syntax operations previously mentioned work for vari=
able
>     flags except for override style syntax (i.e. =E2=80=9C:prepend=E2=80=
=9D, =E2=80=9C:append=E2=80=9D, and
>     =E2=80=9C:remove=E2=80=9D).
> but a explicit block
>     .. note::
>     Override style operators and variable flags are not compatible.
> in all 3 sections
> -
> https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-ma=
nual-metadata.html#appending-and-prepending-override-style-syntax
> -
> https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-ma=
nual-metadata.html#removal-override-style-syntax
> -
> https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-ma=
nual-metadata.html#variable-flag-syntax
> would help preventing misconceptions.
>=20

Agreed, you can send a new version of the patch with those changes=20
whenever you have time :)

Cheers,
Quentin

