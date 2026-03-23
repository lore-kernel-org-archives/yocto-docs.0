Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2F16EC01C1
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 10:23:21 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13862.1774261391071516411
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Mar 2026 03:23:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=RzU77Luv;
 spf=pass (domain: cherry.de, ip: 40.107.162.30, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wo2slPe5nywTHtrt0a7KBNzT5KaVn6lELSjFdbwGpLnOT3Xa3d/bxykm0cXuF44BiVGG4mLgO4mW1FVc0frLXOY/BE86O46CY2WJKPtHG1uCtCj03IgKhFRZbJqzZyFeENR7R/WOkG85W8phsbwri/96WoPWpIhp8HEFUZXfu5mjZMAJ+vDS9lJGV3YDvzcAp+UWybEr/kUZAHwLhYElr5GZjtGU8YjIG+DSmLcEDnVnNTYC/jrp98wo4y3MHkNTJTFeKh85at4LhUxXpNVyuNSxiO8k6DnjuxREm3FYZEJNkk2xHhIbtqoLAME3TeF4GKIR0AeFHbVPo/UdPKsKAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zDoWhLGZOJ31+a6qEUtqm/l9/NLaQ4jEbXVNN7M2GXM=;
 b=yZM4v34V6H+aMez4vvm9ofA0DNvZVRn1BRilTNXTrvnGpPdKQNLaFZ2NITdTIHyqbFaJy5k8ePWBBJaXE+bMbPbHp1Pz+5O2cnGaD6ZSQYQY3H815eS2sJGOcu7+ziUh/6pFJ245TaCHFqB4bVpdn5wuO2tjmRqbTbNXC3hY0nIuOLKqeXejLxhnrsyf5M8ioAagKMu1NeqZtQQYoiV9qx6rmnuX+9ybVCqsCa5SBoj3NJoEf02PhHb53QOBI9YTnuo5lcxgnEiIYBz4hyeKe+2aeLk7yTU5DWA3gFi3HlhIX5n5bZ3UM47oKLkKCYsaN0pnUOEClWKg0xrl6J5EPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zDoWhLGZOJ31+a6qEUtqm/l9/NLaQ4jEbXVNN7M2GXM=;
 b=RzU77LuvjywteHIjt2uKPnAvxh4oSOd+y/cRHwQ2d8mZCXwAKYotZDCU4Pby52ZjPYrPJ75UJzk/RvKcMgTiWHvUIFaK01/9ltCqpRVCbx3L7VVLxmghew0GmsUqN9b/i7P/88RfGNsHD1gfsUBlKRAW0W3Bm/TbYzuSWHHjXBw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PA1PR04MB10745.eurprd04.prod.outlook.com (2603:10a6:102:489::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Mon, 23 Mar
 2026 10:22:38 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9723.022; Mon, 23 Mar 2026
 10:22:59 +0000
Message-ID: <1598e58f-3185-4f3f-a7f2-146eca70f284@cherry.de>
Date: Mon, 23 Mar 2026 11:23:05 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v3 4/8] ref-manual/variables.rst: document the LTO
 variable
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260323-release-notes-6-0-v3-0-844ec702f95b@bootlin.com>
 <20260323-release-notes-6-0-v3-4-844ec702f95b@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260323-release-notes-6-0-v3-4-844ec702f95b@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VI1PR0102CA0045.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::22) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PA1PR04MB10745:EE_
X-MS-Office365-Filtering-Correlation-Id: 60b9a8d8-2c66-416b-b976-08de88c62800
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|7053199007|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Z4t0ZeSH4gO7nc42ZA1kuB8U9WYr4ZqqZrV96Vxmu2o+lasP78FGBZXOqzuLu2iF/XJ0zPu1uQDHxIX5h50vwjs8iUMg/FhSWwd6fKHdX9GgA0TdZAbhXNeoHeje2kKlVYjthyCIPvA9j2BWwyZZChYTS/nrdy7dU8m5l2zCHOwYbfaL602mu1yEOVbB9KyEXQrZSOmZrCq2x3+c2o3ei9qGgDdEjyKdwE+jlcVM0lsquR1eAE1bTpUp+cB+fMGD73Ro6BMEg1XNEanrjqoSBGwLR0S+IFMxpEPAgNNXeGWO2HaGC23nGb0QeTXJ2ByKgZ6UtrjnUMxBpzg9nv6u+OqDLBQd5LVZjGIw1wNkau5O6wjCtSw3Tfi4CberPQHTWyIuul1Ae1+wsqcMnCwEwS2kStuIu4vHLW1QW179bPZ+YuCjhWUMCH78N9Cz3X8Vewo4aBacf0JylQsf9KVLcJZV9dnOuGaTmgR7BN/qUldA55txV+vwckNETJ8LYcFfxKNfDgSJWO5WLo3YwvCGExSPY54Sa1cHgfeLW95jWpVt0FGQNe4NgcwMvjciDrYJ3qyuRwRUmIfpVjs05W0xcN1XntZozcvcZwwUWdZQwbfEn6vhn7U5uLhRqhoL0Utg8ji+ug069A5PqAUQOhkenshp+DiK9qnqxAcMhI8qNskYNQfVYjSUcIp3hPBM/EjB
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q3pBQUpaVTNzbFcyNzhMQWZvSnZvSkxqaXVMR2JLTFdCTjZ5Wmtma2lJQmFL?=
 =?utf-8?B?TzJBcE9TVStBY011cW9kMFlSVkR6TWg4NzdQVklnZlZybWUvNnJSUGN6YWU4?=
 =?utf-8?B?K0NnOFhLK0kvbWNJVFlKMllZQkJzMGdmVkllUERIZDI0MUwvQlQzMkNXeDNs?=
 =?utf-8?B?ODZ6OUJHV3BHMHRzTEl1ekFxaXcrdlpwVDUvTkhOZ2N6MW53NlkrSjFTWUdi?=
 =?utf-8?B?NnREa1Nqc2VJRkNIZTZFbkRIV3NYN04xelpTSEJxNUhpODVWUEtSV3A3YXdM?=
 =?utf-8?B?NXVLVGh4VlpxV3NsbUtBWHloS1JidnBlUnB6R1VwU1VxQ1lxNUo3bktVMHZv?=
 =?utf-8?B?YmlWWVFBMmduYWJXYmJncGpPMG43bktQdDFseXAvQnYxTjNyNGxmaGh2eUR0?=
 =?utf-8?B?cFVPL2dQbklldzVTeUt4Q0o2dUlXV0F6RVFhY25xS2dNQ3dkcUM2bHZDTUpK?=
 =?utf-8?B?TmJocEpWdHNwK0YvNC9IcmJVQmlLRmowVExRRVo2VFRMSzdsZk5abG9pcG1m?=
 =?utf-8?B?NDlraEJ2QTJDN1E4dFZ3bmR5YWZ3cmhYaDh0RjEwalozclg1WG45TjdMMmtm?=
 =?utf-8?B?OWJ3WEJkQVkwck5mcWRtZEVhR285KzE0eEVBNzFJaUNLY3RpbWUyckNpdVI5?=
 =?utf-8?B?Ni93YnRGUEJwYVRrSzh0WGRhVUFFdm1wVnZiNGZseXd2em92NVJlQ1RNMktw?=
 =?utf-8?B?RDlVZnNXSHp5c2V6SnBKUzdZQUlNWkVJQUZPUVB3WnliaEI3bTg2ejB5Ym5V?=
 =?utf-8?B?M0RZeHJlZ2xnRS92b1BVVk5wdGFzZnUvazl3d1JDQ3gyTGFwV2YvZHY2Z1Vq?=
 =?utf-8?B?UElGQU41Zlo1RkNsOEVJSXlLS2pVMlNNUHN0bFZwajBiWlExbUJOMDZoQ2U1?=
 =?utf-8?B?dFo5d2NucTg5WlgrL0hHMzVmUitPOTZWNzVCSVp1cFF6SkxudHhzSGE3d0Nh?=
 =?utf-8?B?VDJSSXlGN2pxRGlaN3VySlo4N2F2Y0FjU1ZGVnlnM2kxOWNnR1lWRmpqZDFx?=
 =?utf-8?B?a05oOHlPOXRsYzJjcGUvTDBEOCt5VFA2Tnp5eG1XUGI1U0Rpc1dWVUhxSEta?=
 =?utf-8?B?Rk9PY0pBb3RSb2h6eitmNWhqU2xoeFVqZVlnSDcrK25LSDJSMkI2WGY2SUdr?=
 =?utf-8?B?UU1Xd3dsR0ZOMFBaclp6QU90ZGVldW14V2psK2NEbDRHWDFJT2NVQllDaElu?=
 =?utf-8?B?NkRDWlo1TlBiU1lkOVdKcG1lK0N1VnBYYkF6NWNjUlBsa3BtQXY5VThXQ08x?=
 =?utf-8?B?STJtZVB0QzhTOHN1VC95ZlNiTDlEYTFHRDhvTmNDNTlHMUFzNVdLN1VLYlFO?=
 =?utf-8?B?MDhKOWVCYTA4OHl1eU5RZlJQc24zMDBzNVFXbHRxMVA2SGxoYXQybjB6UWM1?=
 =?utf-8?B?VS9WMFN3VGFXa0h6ZVI0Z01MTDVSS2VKUXBQSS9KRklHb1NXbnFUM0hnRkpk?=
 =?utf-8?B?aHh6bkRSSys0UCszcmk0ZmlBTDZVejNSckwrZGt0ak96Y1NlRXk4S0NuZ2V4?=
 =?utf-8?B?cGFxUlFxb3dodkk0UE1hODJFaWJCOXFrWnRaMCs2REhrNWV5VldLL2NtODBj?=
 =?utf-8?B?QzVzc1d5NVNSemZ4THozeTEzLzdMQTZoMDZYb2cyODlPMmpUa0ZwMDFvdlBk?=
 =?utf-8?B?aWVRQnN2alNncXQxWUV4VzBBQTExbWVvbENIMjZ3dkdBQVN5MG1Rc0VmYjRM?=
 =?utf-8?B?S21tWFh2eW02VENsa3kvUDZCRitGNkVOdTdHYml2ejMzN2t5REtCbCtTY2dp?=
 =?utf-8?B?cGdlM05SN3YvbXB0d0FZTHVwY3I4UEpuVVVpM0g1dWt5eVhJZEozVE9kVDZ2?=
 =?utf-8?B?VGw0T21kaWQ1dnBMdHQyMFlCaHVmOXNSNDlCOW9yMWp1anBtNmhhNFYrbU11?=
 =?utf-8?B?NmtYc1lqSmlTQnN0YXNuM243WFpmT1JVTXFCSU5nQWtBVU5hN2RvNlhJVUtx?=
 =?utf-8?B?QlNYeDMwcm1KRWk3TVAwRTVSSTdQaGhmQW5uZ1BheGF5YzRkWnRhM2hheHdX?=
 =?utf-8?B?aUhsVm81Tkt4YWwzSDFaaWJaWGNiWjNPMExPRUYzUXo2TkF0bHFnOWFSRytI?=
 =?utf-8?B?RDBmaHpnMVJhRzExOE11Q2hVajBHNzFyWE84MVRWVlp0aGx1K0ptWTUvb2dY?=
 =?utf-8?B?RldhdWlVNTBBMTdJL1I3aXJFenpLbUR2Rk9ja09JQTdTaGQvWmJDaUlsQ05U?=
 =?utf-8?B?a09TYy9tSFU3M05RMGJmSzJoVVRoeU1GVkVCRWM4eVRlYjlBdmNobk9qdHd0?=
 =?utf-8?B?N3VhMVhhdktKNTVmeFN0dk1HRi9VaG01eGo1L3RrMlF2eVZVblh1cHpoQjlW?=
 =?utf-8?B?VmluNHF6a0UyVnNYRGlNOUxiNDgrSnZUOTcrVG15UnU3UkVXSUlFdz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 60b9a8d8-2c66-416b-b976-08de88c62800
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 10:22:59.0370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I6WgZ+6io+7YBxpcORjNEltDmy1hw5Gtcy+FoDqQ8V5mkctGfrvNe4vK5/ayXZAz8roXIDEr8w/NBWynccAryKvtUxlYWaW6GTIOQBAt3pY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10745
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 23 Mar 2026 10:23:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9124

Hi Antonin,

On 3/23/26 9:49 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Added by 228b5a91516c ("lto: Add global LTO distro policy file") in
> OE-Core.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/variables.rst | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 45542d715..6c779e42d 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -5890,6 +5890,13 @@ system and gives an overview of their function and contents.
>         For the directory containing logs specific to each task, see the
>         :term:`T` variable.
>   
> +   :term:`LTO`
> +      The :term:`LTO` variable define the flags specific to the ``lto``

s/define/defines/

> +      :term:`distro feature <DISTRO_FEATURES>`. The value of this variable is
> +      appended to the :term:`TARGET_LDFLAGS` variable, adding `Link-Time
> +      Optimisation <https://gcc.gnu.org/wiki/LinkTimeOptimization>`__ flags to

LTO isn't GCC-specific so I find it a bit odd to link to the GCC Wiki 
(especially to a page that hasn't been updated in almost 17 years).

Gentoo has some documentation here: https://wiki.gentoo.org/wiki/LTO. It 
describes benefits, downsides and how to use it for llvm and gcc.

Wikipedia has *some* info on WPO/LTO in 
https://en.wikipedia.org/wiki/Interprocedural_optimization.

Cheers,
Quentin

