Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 870E8E7716A
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 10:28:07 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.49])
 by mx.groups.io with SMTP id smtpd.web10.78495.1734431286418887021
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Dec 2024 02:28:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=lC6+/ztk;
 spf=pass (domain: cherry.de, ip: 40.107.22.49, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o8h7zNF8nMMaFxgFOLQvvzOnNkzDgHO6Dg4/RSgQ1qfK16RMbFJ04VXkeoLw3QDydaDKZxf1zOq1A4oeS0Zvhu3jcSaZgALu4lTphbTrKrcdEI34awE3hLtaZyUExXv0GMaRCkBsqxzoF2cmnWeIeNiEOw7fhp63WifXK+mzOpCgUOBv+z4makcWqDx1B7+3sRFAIj/L2PnNJokeE355GwtjsK5DgqAqKJYIWjtctHumERd2igP4N2orVpEiCwLY3gELohG/0oFbEsbLXow6gQbwh8DCdD+CEcXNBWZu7/XLm7RclVVxIb5FsfuVs5ELNfeYjuE/cIvaXiPLqUCxhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+VdhKFmdFKh0sqOSLHpleY/IARrdLzbeBtPgm5p85Gs=;
 b=WRqYvGgVDYyxZJxWEs1/tiQiLHp3Gb+2oxVuxtbH96810A+ZihaB9+Ylt1rVhKyVHNm6u3LPC7rfUt7XwkywvkF6KBUlCW06DUWYTovhAAxGTBSc6vuCT8hpHEV99HV9ouWvYupEUm4KKx39es/CQ6QRxfK7b9XKMWpXr487+vGMosg7koHRFphgWnBbmgB2oDmtTuaMvFQixWzJhbo5U15AeEjPBkafsWDKlXaAWx+Gq2YFDseRzNiQLBuGcfrSeu8s+ta//N5TGuH+Wd/CR2S9PI3B7zY7IPGhBXv/aUOkemEz8cvvrcCklsQpQOxL5jEx5sZw37r+IXY6p9SamA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+VdhKFmdFKh0sqOSLHpleY/IARrdLzbeBtPgm5p85Gs=;
 b=lC6+/ztkdhFPGLZDoioZMyRcQTGPtdFnE+M5aIJEKPvkzTuiAioI+GA0ecXd7Ev/gZI7ZbNlJixHk+JR2dsXj2Q7KBVCWFsDOoAMm6g/0Xh57zCdeb8GTn3czfmyxO7z73+xG8v9dWxqNxdHXI0yoBP6xryvqrerN8B8GCOFFIA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU2PR04MB9130.eurprd04.prod.outlook.com (2603:10a6:10:2f5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Tue, 17 Dec
 2024 10:28:02 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8272.005; Tue, 17 Dec 2024
 10:28:02 +0000
Message-ID: <d7c0659c-095f-4757-b19d-e6441c5aeb13@cherry.de>
Date: Tue, 17 Dec 2024 11:28:01 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [yocto-docs PATCH 03/14] ref-manual/variables: document
 the FIRMWARE_COMPRESSION variable
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241217-release-note-5-2-updates-v1-0-b189493b1b09@bootlin.com>
 <20241217-release-note-5-2-updates-v1-3-b189493b1b09@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241217-release-note-5-2-updates-v1-3-b189493b1b09@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0075.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::10) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU2PR04MB9130:EE_
X-MS-Office365-Filtering-Correlation-Id: 38c3f9ef-cbb4-47cf-101b-08dd1e857c6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZWdvemoxdnV1cGEvT1lkSEtTWlBURHlYbzhnR2swQnNFaUJjR1NQQzdPS0I2?=
 =?utf-8?B?S2orUlNGaFIxMHVVSUcxSXIraDJORnp1M0lqV3NIWTNMb3lKMTl2UXd6K20v?=
 =?utf-8?B?NjZJS3p1a2ROU0tXa1hmRmY3cDFqam5JaWJ2VTdnV3JGVXpoeTVyWk5tSVhL?=
 =?utf-8?B?WHA4WlJQRWJZcVQ1TUJMbnZnSWgvQWxSUm5yUnVoNDlhbzRwVHhoZCszcG82?=
 =?utf-8?B?V2xDMTFGZTFDdXNnWGE2bzFBS1M5bENnWFZSM0xDdnQyZjBpTndtVkZYU3BS?=
 =?utf-8?B?clgyLzBVa2pTN0djQVYxRXJFNE9hV1lCdWM2TkRoN3plWGxjZzhUWjJNZGlI?=
 =?utf-8?B?YUgyWFNBbTlBaHBtcVBMS20xQVA0ZGN1WlpOdnJjTERXMUdFYWZkYXdoVHpG?=
 =?utf-8?B?RkNqeVMyZkRWZ3hwci9TRlpIcUw5SDg4Ynp1S0ZIa3daVzA2Zk85Uzhsb0JZ?=
 =?utf-8?B?S1FTVzYvdVdNQlJaRjdvejdnNVd0QXIvRmV3OVk4eHExZGN6cVIxeXJQTHFQ?=
 =?utf-8?B?MG84RGtTMTlQbHJOSHc1UlNzbHNNMDg2c2RyWkVWbzVueWtxM2tzRExKb05G?=
 =?utf-8?B?Q1hXaG1Db0tPY0tIalRHZTJlTVFqMkJzRTlRZlRFNTN6SndoY0tFczJvbExS?=
 =?utf-8?B?RkNrd3ZkK0lUMlpUVGNBQlZBeXYzYnJ3Z0YxZ3dLaEJENDZJMmwzMWNWWnBm?=
 =?utf-8?B?NDdmbElsZk5DMWlFaEYrdWpUNWZ5ZW5BWnFxTE0wdVpVbkM1K0ZPT1p4RHJH?=
 =?utf-8?B?Q2R2QUprTUF3MlZOMnZCSWV4RFMwS1lEOUVLalliSFpGbm5pcUJvejZMZTBW?=
 =?utf-8?B?L01lQTBQRHRQYW4wVkJwSng4ZStXbVdJRVdSd0hPU2E5cFBneE1QamNCU3cv?=
 =?utf-8?B?eDZQVXIzZHhvTjNaRWJRbWZMcjJLd2VDVm5JRndyM253cWszNlZxTXRGVlha?=
 =?utf-8?B?OGFwalFUeXkxWjdGNStrQkhLc3dqeG1xYVh1U1VmWDgvSFNZdzN4Q2hlcmRo?=
 =?utf-8?B?ZXNVYi9mY3FjNFhSSTgvWmxTTG1pd2VlOTE3Uk9ZejMzMVNvZGtVZGxQUlFO?=
 =?utf-8?B?T0NoVjBlbG5SNFhSUW5xMXE5N0I1WGtlcXRBdUMxNVpMWnF0Q2pObFZpZkJS?=
 =?utf-8?B?Wk91V0dtbHRLd0FnOU1kREZUVjdnemMwL2NtQmgrOUkrdC84RXJPZXRMazNB?=
 =?utf-8?B?QkxLK0NDY0g1azRKUXVheHBCZW0zSEdGY1psT3IxKzdZTHd1aThYZmVLQ1o3?=
 =?utf-8?B?R1hmdVBJNksxcStNcXRyQW80T1ZlV2RNNVVNamFlQzBOdXM0RDNreVdRU2NZ?=
 =?utf-8?B?allkdHlGWGRQTWhyZFhCVzdEQ2pmcjNyR3Z3bklGbXZ2Tis3L1pUL0d4NVYw?=
 =?utf-8?B?cEJzbTBYK3grTzN6eVU5Yk9rNWt2YzZUcXExUkw4RFNkVVc3bWU4Z1lvYWlx?=
 =?utf-8?B?blY0Y0wyRTMvMnloMVV1dmhVc01TU2E1YnM2eTRwV3NvWnVGWllVakhHdnIw?=
 =?utf-8?B?Q2xZMWx6VEFqVGlqKzdmOFE2TS9WRm9GdHE0VGpzbjBhYXdyQ2M0bXpRVWc5?=
 =?utf-8?B?Wi9RVElrdHg3U1J0RUZjcVV1Zk02VFMraGpuR1N2MjBJSnhEaWg0aE52em9j?=
 =?utf-8?B?b3RTSXp4OTlLbkE4RXJYSWQrVDE2VndRaE13N1VlcXlxam5SZXVhU2NiODE4?=
 =?utf-8?B?Z2NLSjhuZm5waDNLQStvRlJJKzZLSmMzVnZzRTl3cm91NFQrbmc0SEdIcE1Q?=
 =?utf-8?B?NFIzTWc4WWF4OTVhQUlpTWtPRTJrTlVDWnFydmExa3dKRXQrMjJRREhEWG51?=
 =?utf-8?B?YjBQTzBpdHNpYVlNZmlGYmJ5TE0xbEZGSnRxRmZhaXluYmtvRkh0NGVCM2kv?=
 =?utf-8?Q?MYCuLuwBOpRrl?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?T3dFbnZXNlBDQnJHenQyV0R0cVdqZ25WRE8yZnlFT3lTcUJlQ1hIK2JJOHo3?=
 =?utf-8?B?N2RGSm9TcXMvdUNDVGl4Y1hZRzZmQ1psZmx6c1FWWUhPbEVyaVRYNzJFcmZM?=
 =?utf-8?B?U2ZrTFM3ZEtoSk1lcERITmtVT3YvbUdkTTRER1Fpai82Zk9BdWhzTVdTeU93?=
 =?utf-8?B?QjVqNzZha1NJZTBLN0t0K2JMVERicHZSR3hsUEU1LzZMZDVXTFJtNEtPTFF2?=
 =?utf-8?B?bk4vNzUwMm9EejI2MWhyb1BFeFM4R2ljK1VRZ080Rit3NFpQbnhpR29aM1Vy?=
 =?utf-8?B?ZVJnWFZqWThrSzBPUWI0WS9malJvVUsvOUh1emt0UkVkS1Z2SENlbmVvUGdN?=
 =?utf-8?B?Y3ptdzRkaElxYVlKcTNqZXI4Y0VscVdVRjY0SWdTdjYwTlQrMmdtTE1XZDQx?=
 =?utf-8?B?S1lYUjR6MXNiWEFvajlJYzg0WjBoc0dZdkpNWldJRERSMitDdFZvZldDM1FB?=
 =?utf-8?B?cUt6cVVZczVCdHBHMUdzb2x5aHBsR1FqNGdKZXVBbUtyQzNPWnJoWEhweVFC?=
 =?utf-8?B?N1F3OWw5Ymhwd3l5aWkwdjR4aTRMenAvZDc4aEJWYjZIQmJMSDdRTWRPK1NX?=
 =?utf-8?B?QWVUbFh4akNUQmY3QnNQOGkyN3ArazRkU04zclI0czlZNnNNeDQwbUNpVHdH?=
 =?utf-8?B?aUFRUzZFTGVmMis3d0tZc3NVZUwwdW9qelAwdWVzZmJRTjdtOVRaYTg5eXVW?=
 =?utf-8?B?OW80SzIvZTYyTEVQeGJVRk13N09Eb2hEYVdIVlZhTk5tdTNKdDdxR2RLdGRz?=
 =?utf-8?B?VFpwTE8wNzFRWWtzWUhpQkVReTE2WmFiNlpINkw5bEFhUldhS2NSUzA1aDJl?=
 =?utf-8?B?dXNnc0UyV2p3TC9FOHJlT0dWUWVTZGx6THU5K2lXenFlOXBIWnRpTHlVU0Z2?=
 =?utf-8?B?VDJ6Q3BlTTRZaUlLbEg0L24zQjRjcWluQ2YrNnFsL0ZnMllsWGd6YVd1MUYx?=
 =?utf-8?B?b1FUYnJiMDdQOUkxVEtlN3ZzcCs0Z3pGWnRzdDFzSHVkcWJsN3VwdFdhVEZ1?=
 =?utf-8?B?Y1V4YmpWUE5XSmNHWmVtRmhtaUhGUkthZVNZWGQyMXF6b3pGd3RLTStpNWlr?=
 =?utf-8?B?TnhrQzZqWXloTnF6eVlBUlFndUE3NWtkazZ1dmFuTlEvRzRwUC9zaStDTXYr?=
 =?utf-8?B?ZVQ5TlgxbDRZYnZRRkdGbWlZTzRGeFdkaTN5bkNyWDFQUVBoUjRub2dhSlJy?=
 =?utf-8?B?SHFxZzRLNFgwaTFLRExMdno4WTJNSUJnME5oalJoM09KQ3dlVyt2Q0NrcHlQ?=
 =?utf-8?B?NFFsRDZxeXVGWmVQWDg1UU1GdEk5NFJUM29pZnJncFlLRVdjdzY4aWVCTHhO?=
 =?utf-8?B?dER6dU43K0tRa20yVmhDQ29nWW00YWIxNTRCdFZKRzBMSDhOSmo4a055bFJR?=
 =?utf-8?B?RzZrd2pNLzducmRRMXExZktEWU5vTUgwWi95U3NpY1p4VVR3aStxR0RIWXNX?=
 =?utf-8?B?YnVsWFdRNWo1RFh1TkN6N2ZNeGZMbEFMeUd2d2w3cXdFRGN0dVRybm85TFVM?=
 =?utf-8?B?UjhydHBzSkxjNHBSMyswRGpqK0tsK0ZpSmZiVnRwTVZNS0c0alBmTURRUTNs?=
 =?utf-8?B?RHRJMWJLcWphSUk3TkMyVDJPb2tJR0I4SzczYWVTVnNlSk52RVg4N3RpZTVx?=
 =?utf-8?B?MW1YWVR5elVnTXRtNmp2QTlqZng1ZDZTdDRsUTRMek5GNXlvKzlFRkt2aVUv?=
 =?utf-8?B?WjNKbmFUOUlDdUk4N01EU0ozUEU1dnFnd3F5dlhUV3lVVjAvNXVUUytRd0pl?=
 =?utf-8?B?TVBRbW9vbnBlRW90eTFkV0xjL2wzdzJ5MFFZZ1hWZnlMNHAxRVBCTFB1YXBB?=
 =?utf-8?B?ZzRLb3B6bTBYRytvNXVwOEdJWkVySUNIcTFqb05DMGc4ZzFIajlpa3QzbFR2?=
 =?utf-8?B?Yllyejl3MVZwckI4NStOUUNGNXd4TEJrbWVwK2dUdG95VzJsdVY1NW1OZkdR?=
 =?utf-8?B?MlRLMlM2ZFAxWmxpVzVhRmJvQWNPdlVnVy9id2xpcjdRalVmdHJVcWszMGxy?=
 =?utf-8?B?WkFVRWRqZzk0cWtpTU9jSURLcjZ2REd2V2l2Tko3MmdaTWFOOGJOdDJqUGJy?=
 =?utf-8?B?STBwNnR2eklZVGRJZjlvb2pVN1pTdmpGdFVkbDZKd29JaDVaMGp3T0VMOGdl?=
 =?utf-8?B?enRDNCtJc1lZN3JibkxMS0Z1RGlNWnYwcjErWE43VlI1NmcvQ0VDZ1BGL1ZB?=
 =?utf-8?B?cUE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 38c3f9ef-cbb4-47cf-101b-08dd1e857c6f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 10:28:02.6620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c1FyWWYDNw24yxXjJ86TMx2N29tz3QK6vlk5XjEqjSR1AfnIL1T6bqv6FbpzKsyGrKeHeLTrBXG06WAKvOQ9OHWGNPC1P4/UzzieE1BfLTc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9130
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Dec 2024 10:28:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5952

Hi Antonin,

On 12/17/24 10:27 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Added in oecore after the 20241017 update.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/variables.rst | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index c6d3d1bba9961704fca25921b346d5282e118db4..5875ee3e7c554ffedf4af86e61c207d10aa46ad9 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -3039,6 +3039,12 @@ system and gives an overview of their function and contents.
>         tables, examine the existing ``fs-perms.txt``,
>         ``fs-perms-volatile-log.txt`` and ``fs-perms-volatile-tmp.txt`` files.
>   
> +   :term:`FIRMWARE_COMPRESSION`
> +      The :term:`FIRMWARE_COMPRESSION` allows compressing the firmware provided
> +      by the ``linux-firmare`` recipe. The default value of this variable is an

s/linux-firmare/linux-firmware/

> +      empty string (no compression), and the possible values it can take are
> +      ``xz`` and ``zst``. This can allow significant disk space savings.
> +

I believe it'd be good to state that the kernel needs to be configured 
such that it can make use of those compressed firmware files.

I believe the config options are FW_LOADER_COMPRESS_XZ and 
FW_LOADER_COMPRESS_ZSTD?

Cheers,
Quentin

