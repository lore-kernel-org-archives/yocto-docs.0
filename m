Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4293BC5B543
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 11:12:36 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.13])
 by mx.groups.io with SMTP id smtpd.web11.83813.1749553949671482903
 for <docs@lists.yoctoproject.org>;
 Tue, 10 Jun 2025 04:12:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=HD+1Blrk;
 spf=pass (domain: cherry.de, ip: 52.101.84.13, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ILqtB7fjUx3MGi9EqpgOQ9hby+tbvdxJq/aKDwnCg/7jbBz6937YrNNbnzNBVRK+ID2dkuCwKSAlrpUOsyVGtwxh1BHUox4NK3fw8jxolegyeKSHSokwD5o8pobZ26gU/Rv9wYzDl3G6MiYEYl+4tYXweFhnT1Ey472sn6k5aQRWDUacEzGNsPS/JKr5X07crisSD6DWlqJu1cuFmPiqzljPmvF8+i7aB7ODgtFIAgtAu39RwU9gGbBcbEycdCmBXg9FoEK+lZwXgkmKtOTaVC+Z1/BgtTVsmjJPyVccTRAyGzPyIMTJu0hRE/k+wdWCDP73lDShQBr/bNQukK6jsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1VZ8Xemp22rAh816DSty9pRaNeQg62jst2ua43t62LA=;
 b=ubrVJzHNNl3ETf/0COaZCGX7s+cIXHHLP/Yf3dljHZm8yG3VT9g61mDl6pStp4fCr933haWHddTQ8mnwRictCP3C8DGOOLd/WmF92myrfAcAt+JkmakuW2NLm1gCEBxbWJdFPY4dTn9deLBP1bQxPMbIOOkNZDmySePC9JrfO3XV47q4yclmRKc+q+PdffJ4WM8WLKOr2QvuDKMTa2HdkMGz8bGSOBWxzAYWlYipFjo32F0cC8CkIJ3t9o2UHV7r21LpRiH6yHJC0ZHoASk4fH8BAhIcuHydJgIMIfTvpd1mH6DUEQOm6qWiL+15KBPumOX4nfQT/t2ydGfPlt1utA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1VZ8Xemp22rAh816DSty9pRaNeQg62jst2ua43t62LA=;
 b=HD+1BlrkIWab+oJgqmDpqp9PKl6159etc0sF0d34ZEGRAGRTNU9YKU4m8pBYZ81YUQ4AilwrKDw3YRj4uF/LbKJ2U2rGBtRWxAo/YM8RIDADTF1tjJN7Fs7XzFzfZMx3Rn5P5K8cUDQBrOJFLHXA+yrTn9mupU8yVypqikR/GTk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PAXPR04MB8861.eurprd04.prod.outlook.com (2603:10a6:102:20c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.22; Tue, 10 Jun
 2025 11:12:26 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.8835.018; Tue, 10 Jun 2025
 11:12:26 +0000
Message-ID: <726f24fd-6652-4069-b26f-5466ebf43ce8@cherry.de>
Date: Tue, 10 Jun 2025 13:12:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual: classes: add recipe-naming QA test
To: ross.burton@arm.com, docs@lists.yoctoproject.org
References: <20250610101926.2235143-1-ross.burton@arm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250610101926.2235143-1-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0139.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::10) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PAXPR04MB8861:EE_
X-MS-Office365-Filtering-Correlation-Id: 976d373a-b03c-42a5-af4d-08dda80faeb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NjJRd1ZsQnpMKzBiNjZXZjZRQmVIbzg0ZFhTbEw2ZXdnMTdRWkVISDZpcnd1?=
 =?utf-8?B?eWd3d1BqUXBtN0lmWXZzWHFuTG5McE1iMHhzWVBjdjFnbDg4c3ExanlOV3E0?=
 =?utf-8?B?Q0wra3RsUXZ4V2lIL09uM1F2U09QbXlEWlhqeDRqc25sR08vU0xER2tQOUZR?=
 =?utf-8?B?OGl5Tmg3N092VC85YmRmdFpGYmk0MGcvSncwTmJVTHlLQUJ4UURheGliNmF1?=
 =?utf-8?B?S2EzSkR3K0hMbjg4VjhhOCtkOFJObitBQXNIdFVIVkkveFd1Z0VmcnE0M2ta?=
 =?utf-8?B?RnpObHBmNFpnTHhqV09EWHhjdFl6a29Ka2NpUjJTWG1Ca0xMWmg1WjllYzFu?=
 =?utf-8?B?M2x6dEpVc1BmOU9UdWNyRmp2M0taRHZ6ZEV2elFwN3VVcCtYZmdFQSsxb0d5?=
 =?utf-8?B?V0tIZ3RqM3FJak5QN3E1dVRvZmhSblVYTnlnUktwVDExWjE3cnlydXVoZlI4?=
 =?utf-8?B?Y1RPSE00UXJHbGt3NmM1RVEzdGRvaVRXcVlyNUNMb3hWUmd4SXYzMlZyMTBW?=
 =?utf-8?B?TFBmU0FWSjV6SExTd2xvbWRWcEU0U0RkZlJ0VW9rQTZCR2QrSTdzb0dveEdN?=
 =?utf-8?B?TDdDUk1uV0lTRjYrRHVGTlFvcm5FMWpqeEtqRXdZRXZrQjdlMXFhKzZsV1g1?=
 =?utf-8?B?WjhFZERJaHdwbGpPajU4aUMyemlyL2ZmejIvY2UwQWhYcWRaSU92MVpXYUp1?=
 =?utf-8?B?eEJnM0dmQTViTkN6Ykl3Qk9samQrOVpTNVArUnNpN2p6UEJBbUFVVHRFR3hD?=
 =?utf-8?B?SFBYU0ZXM3pNdlEwYktKZnRBMnVYbzlNUEFBSnRXQ3huV3RZb3IvQXA5UDlX?=
 =?utf-8?B?TDJIdnBnZjZ1VXhKaHhTZHkwS054a3ZzL0ltcE9iaXVtekp6OVZHb2VBNlRl?=
 =?utf-8?B?clBhbUNrdEZYZHhNMzV3aTNhUmVTUHk5d0ZBVzRTOE5Gcm5qV3hrN0Q0L0Zq?=
 =?utf-8?B?Qmd1aXJBdDlicFdOOVV6RnpuVm41bTBJQjZJNWRNY0lPSERDOWlvQjh0RlIw?=
 =?utf-8?B?aFF1dVNwd1RRZFhtRUhzc1dQZ3ZtakhYUUR6bVFXQWp0ZEEvNEdGVjZrVEpT?=
 =?utf-8?B?WTFmOGhiTXZKVDhrN0ZqRlY4Z2JQUWU2ZWU0bjlLUFB2NWFlNTFXNlhFaHc0?=
 =?utf-8?B?d2FaOUF5K1p5NllpeWpFVDZMYzMwa0dTNExNcmhaN1UxdmtqMVdIbTUrRWVs?=
 =?utf-8?B?WldzVFJhdng4bEJUcEJJRktDNnJaUVU0VS85ZWY0a1V2aG5KRGhCR3BoYlRI?=
 =?utf-8?B?MndObWVMOURjeWFZMklLVTB0QWVBbXk1VXJtTEVuV1BHaVFaaEoxdXhhaUdS?=
 =?utf-8?B?dEJZdVFSUDhOOS9ld2V5Nmd6Z0xZOHhaWlpXeVZjbGVnQm5peStqYXdTVHdw?=
 =?utf-8?B?azVHU1hGaG9KMkFMNlcyUFgrcWI3aXRwS1R0YlcyQXQ0Wk5YYW9YWXJqOFVz?=
 =?utf-8?B?Mk43R25TcVFncXFMd0NhVkdmWmVrWk9Pa2N6eW14a2xhTXR4RXdFb3BLTFF1?=
 =?utf-8?B?NWtmZm5tcmpNeEVidVFaeGk0SXR0a2RhN0Z4b1poMDlITnZQUDJMK0hFZExj?=
 =?utf-8?B?U3V6bkVHM2tPaTF6enVpT2tLWjNCcmhvU2xYOG1RNWZxMlFBZ3FraEd5N2VW?=
 =?utf-8?B?bGFnbEJQQmd3UjNpWmVaeFdSc0oxRGZhR3dYenBpUDk2MWRPNEYzMmV6NjMw?=
 =?utf-8?B?SGFIcnBCbEFxQitxcXY2MUZSMTRPZVZ6U1grc1JmZU1iNlhCKzJrd1BsdFk2?=
 =?utf-8?B?OUVLc3plcVlhRXdYcXlUOTFxcGRpNWRrRXZiOW5PVGtkZ2JHUlpFNHVKTlVw?=
 =?utf-8?B?eEV0RnV5VE0yMTl3LzNPbjJua1ZXdmpncklYWElBQStkWVpCUi8zZmxoVGhR?=
 =?utf-8?B?TXpwTEI0WlN2bWdwS1BBL1FDTytjUmR1T3dNdzQ2bWNyQ1VjSzhhTERaTDlk?=
 =?utf-8?Q?CEFgDkcoZek=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VlFYVFpxSWJTL29YbENVSU03YVdGWndXelZ4Nitick5ZRlZLdS9EdGc4U0lQ?=
 =?utf-8?B?Q1hwTlN1aXk4a2JLMTJzeHlqRkNRa3Z3YThJcXVTdlYveHp5R1hBUStmRnV5?=
 =?utf-8?B?blo1dE1JWXlYMXJ2RXVSUGtqQk1WOEZ6SWwxNFVKV3B4R25JVG9EajRmbktC?=
 =?utf-8?B?WGpGd0FuaVZadzVDeCtiK3VocmNzZnpqS3VaNCs3emtJSVAxaW9FWTJteUln?=
 =?utf-8?B?S0xWajZUNExJbHg1UVAxOXBUVWY4bkNNUktlaVJJL1lWUEJsYmZuQUZiSk5N?=
 =?utf-8?B?YVpSUms3d2RXZ3c3eUdjeElvZFdmWGtpL1BaamxqTFd6M1k4YUVabWhtQWUw?=
 =?utf-8?B?ZVp0SitYNmNKUEEvTmFHVDVTVTkyNDhVREdRYVFMVWh1SnhxSmd2VFVoWnlR?=
 =?utf-8?B?SEZJNm1GRnhZRnFWZm5rTGQ5VURmU2trVE83WElrL1lTcFlVbGZXekxqSGV2?=
 =?utf-8?B?MnlXMVcvdWsyQUJXRmpMcE1oazlkTjAvTGQxQmZqTVBzVnh0aStWYy8zRitN?=
 =?utf-8?B?ZGJCd3QvcXg5Nm5CQjFKMzc2MzhnaWlMRUVubWdEWjNmK3F6RUUwbGk4Z0Zh?=
 =?utf-8?B?RnVlTW5nd1BrZE4ySXFuN3FJQm5LMG9VLzE0MXA1L1cyUGVzanpvU2VqNWN6?=
 =?utf-8?B?MytaclpDWCtqbTJzRmNJQVJZMmR4SHRkZnAzU2NnalpiSVVHTXVCeEQ1TjNq?=
 =?utf-8?B?WC9tcUZjeWNIK0xlZkN3VEg1MU5rZmxrRjMwYXY4Smt4UnJHV0M1NUx0dzNP?=
 =?utf-8?B?RE9MMk5RVExUaVY4S2Uzb3lJOEdOdXVwR0JjQ3F6Q1RjYmlnSmZwNlhsSnhh?=
 =?utf-8?B?SHArS3RpUHRSV0dJbEdsWWFyUTAyU3RaL0JOTGYvWHI0ajZSZnpnNzNJY2o3?=
 =?utf-8?B?L0lWTzA5dkNFYWlaZFhPYW01bGg5YVllcTF2L011cjY3YXZUMitLMHYrUzRJ?=
 =?utf-8?B?Mm1WaDZzMkVvQlc5S2RqTDM5OWhMSmpvbW5vdTZLUHE5MjZxNERldE41UlJI?=
 =?utf-8?B?NXBPWFRGdHBZaVp0VlZtRjFDd2hCSEVxYzZKQzVSTG02bUlPNFhLcWFZRXR0?=
 =?utf-8?B?dkl1d2U4aUpodGJPbWFRZ1JYR0R6VWl2YThmUzRlc1J4ZWZHWXdZQ0o5L2ZX?=
 =?utf-8?B?U3VSTVgzNWs3a0lNcHNKUzZRb0RCYU51VlpJcTBQL0Zrdk1kVmdyWEtRRzVX?=
 =?utf-8?B?bmkvTlhyeDAzQzVobk0xUXlUMmVJTnBnZVVHT2hCb0wvNk9SNDIzQlYzbnY0?=
 =?utf-8?B?OXFEbEhxVUtMYXljQ1c1R0RYQi9vbCtXUFdmNVBIWjgrVXh5MlVGZmZIT3lQ?=
 =?utf-8?B?b29ZVUZNTU5iNTBvamp2cnp2U3RpNzBSaVVxaVhyMndHQ1Z4S0p6d1kxTnZT?=
 =?utf-8?B?V1NVWUhQU3BkZkZteWRtZkVqUU5kbWVhc2tEQ2dmVzJKSTFGUUs3bjNPU2Ri?=
 =?utf-8?B?MDcwaDRKVENUYmpSTmNlZXltbVlpeEQ0VDZab1JvQTJGNVlmOXgrSGJqZU9u?=
 =?utf-8?B?TUhwd2kwQXFjTXhwUnR3bWRPZlpXbW05UXUyMXBuYi9QZVk3enpsN1JRQ3JD?=
 =?utf-8?B?ODUwRFp5TDlyYW1DaHU2KzJFUDhTUmpnN0Zld1FnMUlBaTR6QjRIZkVlNFdW?=
 =?utf-8?B?U0dkeEcrODRxa3EwaDEvYnlMZDlUNHVBb2V4aWNZZkpZVHZPdmNKYmpyTnVp?=
 =?utf-8?B?a0JSRFBjS0RiOWJCRm5MdndsUjU3S2R2OTZ2Unc2MnQzN2t4dGRTRnNpS1lq?=
 =?utf-8?B?c25yVDNHcWFoTGttZlRLSGYzQzhaZGFOMWsrZnpFQUg1WTdTalNzcGVvbVhU?=
 =?utf-8?B?RmFDMHI1ZnlZQUtTR21na2RQZlhKQ1hPeVhNdW0xODgwS0k3RHZOeElFL3A2?=
 =?utf-8?B?T0RZamowU2RzcUg5TlNkQlE5QkJXZFZTOEw5Ty9ka3dNcFZ0OHRhMGdSUEh2?=
 =?utf-8?B?Y2pZbHNJMjZyQ2NzR2dKNnA1eGRpS2Y1ZE5VUVkveDZaWWJyRWNoc3FlNnpi?=
 =?utf-8?B?M3QzUlJqbk9keFJaUlZxS21QR0NVbmN2T2t6UGxkcEZYU1l2VXR6YUkwei9y?=
 =?utf-8?B?RG44L0FMOGVUMjZHdGx0eDFPMzVnZzZOVmFHdU00Tk05eG5kb1FJaW5BNTRn?=
 =?utf-8?B?NE81NGNEbFlCbW9iQTdWSkZxV1NXWm1zazRMTUtZUXNER1FDdW5aRUErd0tm?=
 =?utf-8?B?Q0E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 976d373a-b03c-42a5-af4d-08dda80faeb3
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 11:12:26.6396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KuO2RnsVpawrRZa8nO9667vT3yt8EnZyhlbqapqsbGCTszQuXaacJ44bwSELuJXxRGOdYBgyrPfV5xJwoPH3zyibZj42F3YIBYEeygSolzs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8861
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 10 Jun 2025 11:12:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7048

Hi Ross,

On 6/10/25 12:19 PM, Ross Burton via lists.yoctoproject.org wrote:
> Add documentation for the new recipe-naming recipe QA test.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>   documentation/ref-manual/classes.rst | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index 54a98bf24f3..9be1c2c587c 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -1591,6 +1591,10 @@ The tests you can list with the :term:`WARN_QA` and
>      For example, assignments such as ``FILES:${PN} = "xyz"`` effectively
>      turn into ``FILES = "xyz"``.
>   
> +-  ``recipe-naming:`` Checks that the recipe name and recipe class match, so
> +   that ``*-native`` recipes inherit :term:`native` and ``nativesdk-*`` recipes
> +   inherit :term:`nativesdk`.
> +

For native/nativesdk after the "inherit" word, prefer pointing at the 
class documentation, e.g. :ref:`ref-classes-native` and 
:ref:`ref-classes-nativesdk`.

Maybe you could reword into:

that :term:`native` recipes whose name ends with ``*-native`` inherit 
:ref:`ref-classes-native` and :term:`nativesdk` recipes whose name 
starts with ``nativesdk-*`` inherit :ref:`ref-classes-nativesdk`.

What do you think?

Looks good to me otherwise, thanks!

Cheers,
Quentin

