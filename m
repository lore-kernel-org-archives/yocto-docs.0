Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91588CD5BD1
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 13:34:10 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.17])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28642.1780320840916682820
 for <docs@lists.yoctoproject.org>;
 Mon, 01 Jun 2026 06:34:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=JbuVgQmP;
 spf=pass (domain: cherry.de, ip: 52.101.70.17, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WnXn9tRZArmBKLjEPOv7zNe5riTqIdFZ5IEJ9+l4JvIHcGDEPfNyiH9d22iGSXO8AyhOGYsDjVtXzave8KSvAaF0kMjpoT8lF5wm+78yIIvDIwozzPKYYacefSQ0QgxAPZyEIMlvxEIcmAs4bHol5PIyq3wVMqM75LmIroL9U7MCJ04oCQ384Clo83csk2lyI1+6duN7g3PPyGsugah2VnmLGwp+MoC3VYqOrNNhZ6qs6vxa+2R6P2J8j/YtHxR/xWhqw3FjGIMGw7qnwQV+oCztrnFu/i/N4PCKacVv3yGnhRZJKf3EEccvkz85E6OL5SIKuCZcUwYyKGnCB0NLdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8XVxt/yYxk3zxddXxaOS9p/30rdda8l35BmeyP64SoI=;
 b=lJ9gInpOdGkAWzx4OmF7dF0rtPeM5ahW48qPpo3ShzT0U2V20Uh2UIoddtnrb8ddm369+A1WNO/wOpRwguqXTGAN5Nho62KPR+F3v2//PLDImGwKQmJ60kcomhF3Z4M45iPC6rjMfU25hvHaAJxsGyVvp5Le6pkd1zsGxwoS8q2OB6ivC5AFvJK1g5qwowcLihjfTcoINgygDHZm0TDIFkYIf15jUHGIcZK/gitVCQzG0wkyfY95q2wKAAQik8H8XrAjFKLCU0XZMxQBvV6RB8GvjW0YMpqu8Mumtcv6zRxe5rQ6V6qfLtT7CVA6Ru93ePvk9UtfeNIUzBZ1EpVl5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8XVxt/yYxk3zxddXxaOS9p/30rdda8l35BmeyP64SoI=;
 b=JbuVgQmPw1IR3PMMDYlZLvom7C5Vr5qjqb2BT4fW+WqzGQ402KLOXBjS2+Qv6Fax3viGraI1lX792pXbEnAY/coF1e1GcxJI9NQadSbGONNybIf2w19oJ+RkwzjSPOuVkrzRV4X8qMm2l0SXld49o2p1Zlu8srP2mrdKbrLlXFk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20)
 by GV2PR04MB12066.eurprd04.prod.outlook.com (2603:10a6:150:304::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 13:33:54 +0000
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7]) by PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7%6]) with mapi id 15.21.0071.010; Mon, 1 Jun 2026
 13:33:54 +0000
Message-ID: <23c161b3-2a40-489e-b61e-6ce93a8f53ea@cherry.de>
Date: Mon, 1 Jun 2026 15:33:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual/variables.rst: link *MIRRORS
 definitions to the BitBake manual
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260601-link-mirrors-def-bitbake-v1-1-fa69ec343eac@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260601-link-mirrors-def-bitbake-v1-1-fa69ec343eac@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0202CA0035.eurprd02.prod.outlook.com
 (2603:10a6:803:14::48) To PA4PR04MB7743.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7743:EE_|GV2PR04MB12066:EE_
X-MS-Office365-Filtering-Correlation-Id: 927f455c-912e-44e0-8940-08debfe26cd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	rbpJ83ZyI2bE2c0yjTkUBjh245CfU5WoNgVdrlizb5BBJ5sMYyqw7SqdDaJ5t5QWXj8zyVTYRj1IUTO5arFxf4vrVYzceQXeo8SrfIrehcaJkmA8ajbxJdU2q7r0EjGPjM4RDM7DLXymiHhcafCZfKP5wM2qVGqQ4mV3uvT8rH0q5a/gWLYV563thxv46YSoGvS2voS2y+NSsacxUAzlWziuuhOKbhN8PRtt+i5FM5USGkQFLNLJYH0Zl00qV6EdKKZl3LwQxLkkV0m2B5LY3HQFhcFDWlgh1NGPZPehueGvpHFNjDiO/EQZHy+QaM/+mIGu5f8iR2IfrtnxWoA2mKUN+23YAH2y2SD/EZHEKQ6rQFuks7li/ciMCDcwZBniM48nroz3EfdsXNsesnB7AZQ0cFeHYWt648l5L0mrequhY/CobxVFrE9iHpnaaAsiUZcYH+mmX4pB0gluCbQiKvK3C8LOWvIgOUV7a5yQztJbQEyF747KWzypBpp8goqMVC869AjY/8jv3cIlr7eP6LpRg9qIxt2bS49/D7XnjjPSmqLIDiTMSTQxdrENkU1ZshNarjvM7PGlcT8Impi7ELmp7GcB9/V9HpYSP+vr4m+d6UX6mXtnjaAddY6lNG6fTROKGvSvT1ga7YwWP6Gg+mctFqDxoXh9QNYdEfeunnZwm1ySZPvVq5nrTJF/hMQN
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7743.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NFMzVXcxaHlHWTM5RHZRbENyaHZKREFONi9hK3J2ay9nbHJWaHJrdXV0SVhl?=
 =?utf-8?B?K1M4akttWWRxWlRhK2tpdVZ0TDE1N3AwVXozcHN3UmxtRk9vdUZVaDN3bFZU?=
 =?utf-8?B?Mi9CbFQvTTR6TkRDZURvblJMVVBrcU4vUThNYTVUNURuQy9XWlMyVVFqc3JR?=
 =?utf-8?B?MjJrVVFBVXdIQVhPTjN4TXNwTzVZeFN0bzVjTU1oOVloMGhYbVJ4V0oybzds?=
 =?utf-8?B?c1Y2ZGtnWjduWXQxZGp3My9VQ2Rwa2EybENkV0MyOTJrQzlIaWZNQThZMktz?=
 =?utf-8?B?cjN0L244b2Vobno0VkZEcEdJS3dXWWJ5RUs2eXB1R2luUzJ0alhVdWh4ZXZ0?=
 =?utf-8?B?K0wvcjNWK2d2YkMvY0NvL1pHY2FVTTNrdVZFbzduVEVkbUpLaHYvM2FCbThy?=
 =?utf-8?B?UlJrNFNrM29YR0FEYldLWm1qRlZuNzJha20rU3FXazQxZ3RqQW0yYUk1Rlli?=
 =?utf-8?B?V0FOdHFaOFFrdGNRdXFuaGVYTDh0cFZ0R0JDUHVxeUlWc3hnSjVaODJNdXpT?=
 =?utf-8?B?d2d3WlQrelpUVFM0R1VIdXliZHhHR1g3c2FzVXcwM0xSUXJXNDY4b2pxSXBv?=
 =?utf-8?B?Yzc1OTB4WVBTMjdSTjhtWVN2Zzg1WGNTM0tOT1lKSWNCZkdhdWVGUE1XWC9X?=
 =?utf-8?B?dmVpL2tYVXBZcVMxSVVFenJLOU5NVFhzUmRxaWRTbm1UckZ0blN1NEFOdFYv?=
 =?utf-8?B?bEM0QVFIUjhSWDdmTDZ2VnNJZTA0OE45dS85dHNrS3F6TXRuaGtmT25KcVJS?=
 =?utf-8?B?TXIxNlVWa0VyS2h4ZXhFSXBFK3hpcUZ2TWNNWURvRUZ6dmRtbi9BbTVYSEtv?=
 =?utf-8?B?TmtwVFB2R09QeEVFckpJVEt4U3NKTlpFbmNUTkF2S1F0ZUdhK0ZsQzdZMUY3?=
 =?utf-8?B?bCtxckZVS2NsYVNtcjF5RzI3azdzcjBMVENyb0NNejh5SGt5anYyZlMvRDA1?=
 =?utf-8?B?RGwydHdlajJuOVhSU1dpTDNLUlA0d21VbkpVRk5UK3JLYTg5WEZPZDVabFRD?=
 =?utf-8?B?dWNuWWtDdkpQc1c3a0NUeGFPaW1ranZSY1Y1RFh5OGU1QlhqS3JFY1ptQjhY?=
 =?utf-8?B?a1FvbEt6NFdiZUExa1pub1BJSml3TzAxUjl2NHlEY3pGNXkxcGhpN0tKaHl4?=
 =?utf-8?B?MW1ZbS9PYm03UGllS0N2TjY0d1BtOW1GZzkwUXMvamU1MkIvOThkeGNKK3M2?=
 =?utf-8?B?M0dyWTVPTzhQVWVSK2FoNzMxVjhhTFljYkhPTzRBZTBTdEJBRSt0RC9USFhN?=
 =?utf-8?B?UmF5Rk4veCtNbVVkeGtvY2dHM3dUYk9SZHQreUEybUI3NXVNc1dIVktTcnA1?=
 =?utf-8?B?cTM0bFRiUjRERG1VZ0w0SEhqTlMzM0NyY0pWaDlrOE1qMDFaUHFHMDFsYlc4?=
 =?utf-8?B?YXNrdHE0U3hvTGhmZXhuQ0pnSFpDUytlU09ocVROcFViQmM2dDZyeWpiUjdr?=
 =?utf-8?B?MHhERk4vQ3hDQnpQSkxmVkRZV2h4M1dJODdoREZiNFRBTjFyUUIzTWVUMjVr?=
 =?utf-8?B?QTZFejR3Z1ljaGhZa05lb0x6cisxZ2pvUHJablU1cndwdDFpMFlxSVF3elVN?=
 =?utf-8?B?Qy9GVlZZL1doUlIrMnErem9rS2VsZXpwY2diZnZkMy9zQjViMUtWa2xVa1Qx?=
 =?utf-8?B?V3d4SXN4MGZpSmJQWHVJdFZQazM3bUg5YnFyUHhja0IwMUVTK1VoNFRXRTNV?=
 =?utf-8?B?dXpQUk5jU1piWitPQmNWaklPTDBzT1ovNTJnRTRodUZweXg2dkM2b1NldjV2?=
 =?utf-8?B?UGdRRm5QRmdJYTQ2ZE9mdkFHMjlRQkNTd0t1d1o2UC9mMERNWHl6UTZjd2hK?=
 =?utf-8?B?TXhuV3lCeHBCcWFMbEpJc1pGSS9vamxSOVQzVXFRR1NzT1dSdVp1bmMwWE56?=
 =?utf-8?B?cWRUcEROSVR3dWhiK3JtazBGSGIvMFp4NmdUS0VZNzUzbWxNRnI0VTNXUCs0?=
 =?utf-8?B?RHJERWdYT1BwMWRlQmlsa0NWd2JSbW9NRWI2N0RJTHhVN3VQa0FWVWw1Y3Jx?=
 =?utf-8?B?WWFSM1J3QlBSYm5hTEVEMnRMSlJzR3F2cE1XM0ZMeE5pWDVvVjN1aW5ndFRF?=
 =?utf-8?B?Mzc0UW9xREF1N1pYWlpvYkVUOWtpTzU4bUJXcVd6YUh4OWY2bEFvbkdxT3FI?=
 =?utf-8?B?Zys5bjhVU1cvdmdUTXQzQlZScmdqbWM2OFIxVXRtaGc1MzlWdHh4dWc5ODI0?=
 =?utf-8?B?ZmxjcHVoZ0F1RlQ2dFA4bVBZaGtjdWYwY1laQ2xDRExJUWFSVzB6R1NkRFRw?=
 =?utf-8?B?VGRmVFo2MWZQaEMwbTNaUjU5NGo2RzIvRHloSmlrM3VlTEE1OWhBQXF6clFD?=
 =?utf-8?B?V0F3aUJsa2Q3RlVwUDVGQW80TW13dndMRGMrWGY0RlgwWnowU1lGUT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 927f455c-912e-44e0-8940-08debfe26cd5
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 13:33:54.3656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M62WjSouj+ameFtp04MiM8jaj0iguWgemEmboV09FwHCxPEnyAbkywaRVVZXaGHYP7MAwbUWjMbkbeHAlcErpaP5RjTh9hLEUvRLu3jmQ40=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12066
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 01 Jun 2026 13:34:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9553

Hi Antonin,

On 6/1/26 3:29 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Those are defined in BitBake documented, and would be better documented
> there. Add a link to the BitBake manual for these variables.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/variables.rst | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index c65794229..fe3d5a999 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -6303,6 +6303,9 @@ system and gives an overview of their function and contents.
>         The default value for :term:`MIRRORS` is defined in the
>         ``meta/classes-global/mirrors.bbclass`` file in the core metadata layer.
>   
> +      See the definition of this variable in the BitBake Manual for more
> +      details: :term:`bitbake:MIRRORS`.
> +

Should we remove the first paragraph and point to the BitBake reference 
manual directly?

>      :term:`MLPREFIX`
>         Specifies a prefix has been added to :term:`PN` to create a
>         special version of a recipe or package (i.e. a Multilib version). The
> @@ -7757,6 +7760,9 @@ system and gives an overview of their function and contents.
>         ``file://`` URLs to point to local directories or network shares as
>         well.
>   
> +      See the definition of this variable in the BitBake Manual for more
> +      details: :term:`bitbake:PREMIRRORS`.
> +

Should we slim down this entry and simply point at the BitBake reference 
manual directly?

Change itself is fine, so

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

