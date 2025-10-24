Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6048CCD1BF
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 15:37:01 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.70])
 by mx.groups.io with SMTP id smtpd.web10.14518.1761320215933209887
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 08:36:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=L0rMmK3G;
 spf=pass (domain: cherry.de, ip: 52.101.84.70, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w6ypU0i8ijbjW8GhNXCMcSiRCbEmV48Udquu21h5Rk0oG+3v/eAZUXzFnzCsh8joHuYQ0RkN2/w3csiyZqyewqB4cGp4PjX53bWZk0picDqoeuYz2XvJlyL7bsTJc2ZyhNKDxoR5lykNiE2gdcK2/CAPvQlz6GsW7HahQaoyYErwanXvdewHuO9Rkt4K/0iS/X8jaF7u9ji9fZb7Kf005YVzqwWYe6+C233GbovxJgYKjVB1oOawdvtpA3ZSdUd92aLuGREu/pppnVuJoyBu9ZFTTourx1RrBSMcOKjmVBanJvkrtHq7CoIYLYCV3LOWD+Q+N2fmey5nO/ECehmRrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F+Hc12TAbYRB+N+wukl2CDoiJPrYi+6no1A7NWFt1Eg=;
 b=dfaRmP60JjROjiEaKq9HAll24NeCjsOX0MtTmfxBI3c9J+ZLYW28CgcphwTslqfOT+2+vKzM3gGopkXo6Pga1a1JAMvp0t4Gb+BxtjNc+XsV643sjwFTgFb0NkJTUn+PmmKbzNWbADnZhjqytKxu2gxykrYnqo2gBDTmPKGwj6LBB6WjJLHgBU+lv6ujZNOdBFFQjiFTsdCsF3KFMTwMIbssIAtKk8DgjJapG3BPBitZOsNsdEqNI5yxeJ5/yVxJnpLWIStSCh6MsNPkGBbImX8eTEEeXX6M8EgnbW7hFVBCTSUQN/NnVhvL3vhQcOnmsMt4xJz+os4XU3s2UkK7uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F+Hc12TAbYRB+N+wukl2CDoiJPrYi+6no1A7NWFt1Eg=;
 b=L0rMmK3G/DwfUxKTkRzy6B0vPYIrZ0365iGcKBvst64N5NnhrnJQ2gKvh/0AsnzU00E/prb3Vo0d2elCZhDmRG0N3YYZD3zgwyJbjpLtGCzETO/brsrLCuK/qL1lu0Z/6oAnuYMucVCe+E4LLSU0tyAi9mmwkfYY1I4vVotmFX0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU2PR04MB8967.eurprd04.prod.outlook.com (2603:10a6:10:2e2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 15:36:52 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 15:36:51 +0000
Message-ID: <fb3bcb84-1887-4abb-b69a-f7b0c41dae92@cherry.de>
Date: Fri, 24 Oct 2025 17:36:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 11/16] ref-manual/classes.rst: gettext: extend
 the documentation of the class
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251024-release-note-5-3-second-hunk-v2-0-d15dabc095d0@bootlin.com>
 <20251024-release-note-5-3-second-hunk-v2-11-d15dabc095d0@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251024-release-note-5-3-second-hunk-v2-11-d15dabc095d0@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::10) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU2PR04MB8967:EE_
X-MS-Office365-Filtering-Correlation-Id: 586172bc-c664-493e-9aa0-08de13132712
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Zkk3Q05jQVVXU0gzK21zZzg1WlRRdEg3SFBLd0pHSFloTWpQblFzb2hDTVE3?=
 =?utf-8?B?a0tzWGxKQ3J1RXdwWW5MUVI2NjZ2N2Z6ck8yMGJZbW1TaExVVTNza0pwL2ZV?=
 =?utf-8?B?Vklsb29lS0VuZk1waXhUQnIrdW1SSWhHM2J1cjZ5dVU2KzRPeG5yTm1qWU1r?=
 =?utf-8?B?MndMdDl4eG5IQ043M1hxOWdJWmRMVFFlQjJ3WDhhOTNPZ0dvb3Z3MGo1RlBX?=
 =?utf-8?B?akFIMDMzU2FQQkl2SFprbzMvUGxreXZOZ3gvSlNNend2T0ZicW1UekdUSWdH?=
 =?utf-8?B?LzExM2NYaW1pa2NsZG9PbkZab04xZVVOVmY4RzNHUXlQd3ozcGZSQkFGK2FN?=
 =?utf-8?B?Sm9oUlAwMkZOdUxJQS9JbHU4N2ZWQzAxTlFheStZM0xrbTdxSmJmUWhGaHV1?=
 =?utf-8?B?RXVOVDUzMjRxSHFFZnNHMXVjbEVoVGV4UUZuMlVWdlREeDVuVSttS1A4N2hh?=
 =?utf-8?B?YlBRbEZxRDBJSVRJcjNOSXdRcGNMWlRhcHRmcWlOc0dJSFhTVUtNc2NLT3FV?=
 =?utf-8?B?N0V6R1VmYy9iSkRtVVhqSWM4ZXl3aVJ5ODk3djF6VnhjdFNidGNJeXpqQThO?=
 =?utf-8?B?R0V5anlPWWtNbks4c0I5Zy81R1NHblpwWVR0TWRRZFNma0ZjcjE1WTNMek1N?=
 =?utf-8?B?Yzk3UXZrNzNDNFlXVndyalladXZ6RnZTU0lURjZTMEFlTEQyakc4THYxcW8w?=
 =?utf-8?B?OGpsQmhkRjBxMTRpbUZMeml1bTFNTVlBZ0FadEVyMHlrTjRZT3RIWWZlQ1lC?=
 =?utf-8?B?clhhek8xdTlPL3RocnU1NlkzbllhRmV2aExqbkVDZjd4QlRvdS82dDJya0ta?=
 =?utf-8?B?WGlDd0J0eHFTQ0hnU2NOdzFvcEdXeGoyS0tIZWJTR1FncFBRaldsNk9JVVlz?=
 =?utf-8?B?Z21CaGprQmFJQTNTOWhrdUt0NmNteXZCNUl6UThITnNJSzNhVENxSVhad1RQ?=
 =?utf-8?B?bEVJM0E1Q3pMZ01la0Jjcm9UcmtWaHQ4OWs5RDZrUHI0aHhvcjhyR05ENTVo?=
 =?utf-8?B?QzZIRURMWXNYc3BLZlFLSlJTdVlHQmYvNmJ6ZCtHeGJKam1BU2lpYVlDL0tB?=
 =?utf-8?B?cEt1dzlJYzFPVUN6NmdBYkRUN0NObVJISjQwVWRncEEreCs3UFNqeWI3VHV3?=
 =?utf-8?B?U216M3EyV1BPS1htc1BRQWJxdXhKRkVTT0dESGlvaE5HNERMM0ZTSmNZVUFP?=
 =?utf-8?B?cXB3L2psQTlmeE8rU043azVGcEV1ZWxmcjVlcFVITVJoVm41NTBCOFFkOWVh?=
 =?utf-8?B?QjIwVkh5cDBzY3BzQ2ZINDVJNVJ5R2FaY09VRnY3YWNQT281NmV2cGxRV3VX?=
 =?utf-8?B?NEhHSmpaNUQxNkhTK2VRK1F5Q002WHdjVm5zTWc3M2RseWVHQTUvZjNTZEk3?=
 =?utf-8?B?T2pCYXl1M3JvcllaU29Ici91aXp5RVpIQ21iVUloZ1JMK3JXSGRBTXZhaTZh?=
 =?utf-8?B?QU40MEtvb2ViKzVpd3ZDOFlCeVdsYXVleTVRR0h4K2pmMDlrVGMvcEczN3d5?=
 =?utf-8?B?THdnTjBPZkwzdmJCTGd6VWhMYWJlckEyYW8ySXU2WVFzTHI4YStEZDhacHIy?=
 =?utf-8?B?dVpFcEFnb1pvcTFBNVltc1VsalpDYmprL1JodlZqMDloKzI4aUp1Q0NoS3dF?=
 =?utf-8?B?T2xlN2RUZkROOTYxNlJyK2YrcU50cHJmZnYrQjBQTWdwa0lLSUttYUJUQ0Zu?=
 =?utf-8?B?bjdNeXV0a0svZUtOeG1VWDAzU3UyZ0NiUmE4NUdEQXhIeWhWSll3bEFFbEZI?=
 =?utf-8?B?SnRPSmN1aWFHZE5sc2l5eE01L1piWkxzakdQdnhtWlcxTVZRYXp5L01wUDha?=
 =?utf-8?B?RzM2ZGQzY1BoZC8rWDVacE5yUDFpVGFERmR2Z3RVSldiRVJsbGFzYXdCeTd6?=
 =?utf-8?B?aFQ0Q1BkWkRvUTIzbERaL3lCSWZsais3dVRtZ1N4U0VvTFVUaDd1SVlEeTkx?=
 =?utf-8?Q?m2iWWDiSCkPBXFXJZZxmilt135/JbTgt?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZUduSDdpeWIwQVVPaVBVTmxHNGhTOVRvYTFUei9PWXdYbjVOSW9oelkzN1JE?=
 =?utf-8?B?Vlo5d2trWnFZS3BQWlo4eUtFY1Z3RzVTNktnM2cxbVdBNUQ0aC9vZGNNUzRz?=
 =?utf-8?B?QzZMcDFyNkdaVU1ob3R1VXkybjNuYzhJSFBuYlFjYzd2eW81SnFqaVFrVWFk?=
 =?utf-8?B?Q0U1Rmg1VWlBMXROZ3dWTUlobDFlTGtnU3BNaWoxa1BQM1VmUkIrQlZEcWZS?=
 =?utf-8?B?R0xwekhUY3creFRISWVMNVpwRmRRMWZtZHlLTmE2VlRPR1JBQW5vUjJ4b0Zh?=
 =?utf-8?B?T21lZWo1VHptVERnMXUwTnlUbHhFYUNOWXdKeHhTVUZqZlJaSEZBbDRUQUpY?=
 =?utf-8?B?YUJtWnBjU1p4bHk5cnI4RUdMZDU0MVg2S2R0bGFHR3Y0VnR0WCs0WDYwd0dp?=
 =?utf-8?B?K1dRdkZlWmh5VVVHT2gwa2xEYzBUdmZ1blg5UTIzcms1Y3ZYeldNTTFyWWdq?=
 =?utf-8?B?Z1VuV0dOU1I5ZjFHSUFFQU9TRWxQbWtxRmQ4eURjZDFid2kyOE9FbG5kcnpT?=
 =?utf-8?B?bVo5azB1b3l6VnhjRGxINVNHU1g2Q1FkeUhEdVNuUXZNajlkUGlFVUZxVnBz?=
 =?utf-8?B?VzBabzF5Vk8wam9Ob1gzNCtsRTZGb0tqWW02YXZKczdXTTR1ektFcWk1WXN1?=
 =?utf-8?B?cVVmTnNTQ3ZXLy9JZnR0YUxJTXlKcWlrdFQxMlBwNXZxS04yUllvOTR2ajJt?=
 =?utf-8?B?L2F4Y2QrSC84UTFRNkFReWZ1c1dsaTBUTE82RFkveGxlMStmUklKcjBzd2Z3?=
 =?utf-8?B?b01kUTFqdkRob05GaXVVeGdocVZyMStxMmJuS0J2VlZPbDM5dFVTK3g4QUE0?=
 =?utf-8?B?VmxZaGluMS9wSENpcFFyOVRMSFZTdmVpc3ZYai9YNVdPckhRRWh2TTlmRm91?=
 =?utf-8?B?UmlFZWRPekVqak4rQVRXV2NQVnQ5eGczWUozWHNjdHJZQ3RrQVNabjVOUmd2?=
 =?utf-8?B?c25zblE5Z3Yrb2pnM0tRT3RqK3l1TVdqd1o4T0F1aERyWkVZcSsrZXUyYTVJ?=
 =?utf-8?B?UzBLYUcvL2dpZkY4My9GREJQcHp5ekRyODhzWlNZVThSOUlOdWRFYnhjcmJP?=
 =?utf-8?B?TnFWUy9QTDFFalQ1bHI4bU8zSkJQSnFYd1l1MEtmWTE4R1pJSzRGYitaelNp?=
 =?utf-8?B?TVhRcXNzSStCc2UvUnB6d0V3akkzU3FJaHYrMlFLSDE3dGZVeWQxTCtrQ0tt?=
 =?utf-8?B?M0lLdzhUREQ5VzNlSnRyeS9Ya2NWNGFZUE5JcW5lcGlvKzBtK0Y2cVZzY3Rr?=
 =?utf-8?B?YnRTVXRCWXN3K0RtUUNtSUh2WnI3S3RCVGpaNmhweEI1Lyt0aFUwY2F0S2Uz?=
 =?utf-8?B?WWZmbGVVNzRjUTV2NWwrQXBxUTVoL2ptdjFRTUxOcjNGZXJIUUpsWFJqdk5w?=
 =?utf-8?B?cDI5WjhHZHhsVmNJb0dPUXlJbHVjTFlqYUJFdnVFUXkxYWdkNXhtcGYrdE1D?=
 =?utf-8?B?a0QrREFqT21HbldLanpWNG1sTjVCMDNTZGJGcFkxN0Z5SUVUc2RrdjljRGk5?=
 =?utf-8?B?dU1pakd2eFhWb2RzM3VSOUlWZVVJZU9VYTdIcllScm42Wm5GdGU4cEtzd25D?=
 =?utf-8?B?TUZTT1BIVmVsckd0RW9YdkxSdlYvdHYveHVEaW0rOVJBZVZCYWx6MnVyeUgv?=
 =?utf-8?B?eDVHYTRrSzh3WGFNSXU4M25JVzFQMUpnUjlvZ1VoQlR4VGRlQzdkVjB2SFJF?=
 =?utf-8?B?TGFOS3Rjdlpud20zSGt4OS9CdU8xWElFbmU2OUlBTm8xNm0xUE1nSzJZZzJi?=
 =?utf-8?B?N0YzdjZKeW50YkwwK2NLSmNwYlc4bzJLdkZvb2ZKcmVtN2NvaVVPWUdYc3NK?=
 =?utf-8?B?ZDc1bCs3R1NXRFdOOWhJWlpXbHYyUGdCbXhLUWg3d1BSRGsxdUM5NDlMRllM?=
 =?utf-8?B?d0ZaNXRDK0s2VUVCVmxBUWVvcEVzR08reFd1blFaVFlZMUVqb1lIWW9veE1Z?=
 =?utf-8?B?eXlCcW1xNWoxUFNJN25rME9aYnpIWEZqRGhQWGFRa0FZVGZOSzBPbDJlWnpC?=
 =?utf-8?B?WW15b0FidUZSZGxvQzFGSXFzeEl4Qml4Z2FqSTJPYmFJa2hyanZvWWZUL3RO?=
 =?utf-8?B?VWFYTHF5Z1hBQlJESmwycWkxWERZdHgvb1ZTWW9LeHJzVWVpYXhCNnZzTUV5?=
 =?utf-8?B?cWRDYy9kSVNtelRrZ3puYUVkeXVZbDNKekdmemdjTC9KS0NGNVZtUXc3YTlk?=
 =?utf-8?B?L1E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 586172bc-c664-493e-9aa0-08de13132712
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 15:36:51.5132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B8BUYJe/KC4JFlV/MJGwpfsp0ataOhY/rZRljk+9ls2OHQrmcf2jFE4Jjlau60BklsOWM7E4h4eM9U4+SO4PNN8vWiTeac4SjlCAEUnambk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8967
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 15:37:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7832

Hi Antonin,

On 10/24/25 10:20 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Mention the use of USE_NLS, INHIBIT_DEFAULT_DEPS and the cross-canadian
> class.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/classes.rst | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index 34bc7fed8..cd447d2c2 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -968,6 +968,14 @@ software that uses the GNU ``gettext`` internationalization and localization
>   system. All recipes building software that use ``gettext`` should inherit this
>   class.
>   
> +This class will configure recipes to build translations *unless*:
> +
> +-  the :term:`USE_NLS` variable is set to ``no``, or
> +
> +-  the :term:`INHIBIT_DEFAULT_DEPS` variable is set, unless the recipe inheriting
> +   the :ref:`ref-classes-gettext` class also inherits the
> +   :ref:`ref-classes-cross-canadian` class.

I find two unless in a row difficult to parse, I can suggest:

"""
-  the :term:`INHIBIT_DEFAULT_DEPS` variable is set and the recipe 
inheriting the :ref:`ref-classes-gettext` class does not also inherit 
the :ref:`ref-classes-cross-canadian` class.
"""

Looks good otherwise, thus:

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

