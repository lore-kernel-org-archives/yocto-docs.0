Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3994D462AA
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 14:19:01 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.47])
 by mx.groups.io with SMTP id smtpd.web10.12752.1731507531598758784
 for <docs@lists.yoctoproject.org>;
 Wed, 13 Nov 2024 06:18:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=cEoTEfox;
 spf=pass (domain: cherry.de, ip: 52.101.70.47, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YUgjvedTa4QW0ClbTGb921XttHQcev5BGUxf48cdSRA33weYmxvfBstlF6Ym6hZNpq7z3GdZqaVwl8oUfLvvb5RN0x1X4AMH8oFZBjEV6RSHtI1DDZP5Ef7qIB8IL37O1RXc5By+OAhRE3sQSoTJ/mlHT9EGyIkuhkH0enM6cg/gHcPkIzT6Jm9usYpv5nTMWC/QP0DAIWal0H0lneB1Wnc0jy8ehkEbmGjKxfSku7ewfuqg72rl9xQlCtQYaDnqajuKCwjwPB+osTuHceokIIM/yS9qojyIFm5ItYzxJXX1zByi//X2P8oEQG+NUPo0JEoJbYZewo+jHsdrGPzn+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qcxuB1aGwRKc7mrZXgnL1syXd/D/02VikWxb0v6FdDo=;
 b=jIRYtxHXvXhU/MlYIHlkwohyHmc52/C4gTc579lfsYAMqgBJXq4v7ZlkCsPaKcmwz9JEF+3ZVvI+4xxi19ctUUp6V5F6+FKKWLuMKno9swIBT92LeUkx615K6pePMvkYRcnnx4WXC3//kQr9wwBGXm9PRJsOvEnCWWB6yFyvHI1UNccax32ETXzz+v7/G8OCW6ab2cFBkQkKoJyn37xK5d+o3SWcCVfIBBlyqVeNBaQdD9dK8Gq4dgpV/ziSdRhHwjOml8NmyGMSe6Pscd96UnwT8KknB1aRO/orujburMF+/6QO903h21Whr5KcM5Gi94KglToy1+Qv2xOqhgxEZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qcxuB1aGwRKc7mrZXgnL1syXd/D/02VikWxb0v6FdDo=;
 b=cEoTEfoxj1HHxJNUMuryy8gx/yfKX1am/e8nKaOBsjmR7LmPqKoQvtkZtgF1wdgNJ2YVxiZkYCPz4pDvFqt9ZXNVCpxdYHDmSKFCt6qo6F51/35QSADnZYtH9wdqiAHqbfSrNT6WlDQ2reRRV8HXFx+PtGuZkUuV3mWohCw8eAM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS1PR04MB9656.eurprd04.prod.outlook.com (2603:10a6:20b:478::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Wed, 13 Nov
 2024 14:18:47 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8158.013; Wed, 13 Nov 2024
 14:18:47 +0000
Message-ID: <60c8a346-0e6c-4138-8f8a-537c4527f0ae@cherry.de>
Date: Wed, 13 Nov 2024 15:18:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [yocto-docs PATCH v2] migration-guides: add placeholder files for
 next release
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241113-release-note-5-2-placeholders-v2-1-28964033ad77@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241113-release-note-5-2-placeholders-v2-1-28964033ad77@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VI1PR08CA0260.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::33) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS1PR04MB9656:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a2dd887-18be-4e03-b78b-08dd03ee1634
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|10070799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?S0s5RXYxeUF1Vkk2UzhaMmtxTmV3Wk82cStVckQxUmw1TjZjZDQrQm5hOHk0?=
 =?utf-8?B?d1h1ekROU1RmSFZuZjZNbS9HT1VpampudERycVhsSm54emJEREdrN3p2em1T?=
 =?utf-8?B?REZJOGVxK05CZU91RGF1RG9pZ1hQNyt4clZHZm0xb3FIdndYR3RmL3NjSnA0?=
 =?utf-8?B?Myt0NXdHNHBaR2dGZmEzMXl1cE5RelN6a1QvSDN4Q0w5RW5xUmRzUWpWTlpj?=
 =?utf-8?B?MlE3cmJ1aGxvdEYxZG1hWVB5RlJCYnJ5QU9oMFY1WlFpMFgzYmdSS3FMVDFi?=
 =?utf-8?B?TlRQemptcEpMaUlMb1l5MU5DenhwNXZQd3FmTkF2ZHhadXRVaThVayt6TzZt?=
 =?utf-8?B?REc1cHU0UjNDeHdYMUVDOXRicFV4Zm5DdHNRYnFEeHcydVpqb0MwY1hLOTJ3?=
 =?utf-8?B?amV2RXFET0x3K1JmZzBKODVZVVdMNjV6TldteXQvVzhlZ0RoN1JCQTBYSVFm?=
 =?utf-8?B?QVltZENxK2ExMUdGbmdMTEVLbFZYbVZKdDgrWGI3R05JU2tJb3E1WTB0blo4?=
 =?utf-8?B?cnJGY3lYU3FqZkdBZUJYamlFdjdXOVV3UEdTZHNGK0szOWRrakRnMTgzNWZ4?=
 =?utf-8?B?R3NlYlhCRjVYQWZNRVp6SXVVeUwwTTZTcTJwR3R3dElMNlI1bkhjbjVwaEdo?=
 =?utf-8?B?YUk0R0VhWEY3T1F4bFZVdTdSb0VqM2NjRWdaZjRsZ3pDM05ra0FRb0YxM2tB?=
 =?utf-8?B?Q3RiSGQyYkJZZ01nYlNLVGRod3pUdWx4VXFtbDlWN3ZRQTI1bjJXV2ZxTXFp?=
 =?utf-8?B?TnFJc1BOZHhvVFlGdEUyNjRtRW1zb21xcmFFZWtNempGaUpITjY4Ti9lTEha?=
 =?utf-8?B?NmpXTGk5QXdVWXJRekdDZ082Smc4VEpGUGllYUg2UTRQekZib2d5dGF1czRx?=
 =?utf-8?B?b1V3LzhzTktmd0VSM1Mvd3pSc3pYTzJWcDdEWHlRM2xPU3JmRExlZUlXSFcr?=
 =?utf-8?B?WG9XZXBFa3ZuWXdWWUo5djNLUXgwTDhZZXpIUnRtQTlTakF5Ukx0QTZlZCtG?=
 =?utf-8?B?cU1sN1dNemQyM2djMnhjK0FNS1ZZVVNTVVYrUlE1Z0Q4QUVBSGZCd1VWaEUw?=
 =?utf-8?B?RlljUXlia3dRRkZyVFVoUnlZWFFPSWNkOVZ3eG90LzZiYi84L2I1SkdFZ0d4?=
 =?utf-8?B?KzJUUldWQlNiT1crQXdTTHJtckZmVmRqYnhUZkw1SUk2ZkdMVE9hNU44UTlr?=
 =?utf-8?B?MkE1ZnlQWXJMOTFEbHVqcmVSazI2aEZINUxqMEYrckoyTTRFeHo5aUtqMXp0?=
 =?utf-8?B?a2U4SHlrR0pnbW9qNitYQ0UrNldVZUpGWS9BcE1TL1BXZDFIREwrNFZaWVo1?=
 =?utf-8?B?ZVVGSkhIR0hQaHdiT3dOOUJtRHBDNi8ram9tWjUzUk1tZHFGM21pM3h3a0pV?=
 =?utf-8?B?L0xGNjlWcDhicHdLem5QaHYzMzdiRGlCbXJieG5zUVkrWGdraFhpem1ncFVu?=
 =?utf-8?B?OGpUcTZMdXlWeTFkV1VCTHJWcVMrRHlQTHJrbEpUVmhyTHNYRzlVL2FoOUxz?=
 =?utf-8?B?L3RWMElTeS9pam5LSVQ3Q1ZRNkFRS0VFUTJpRmYrajBEdGhkT3ovc3p0YmZy?=
 =?utf-8?B?UkpMZlZuaFpMYnlta1Z1Qi95R0kzRDZlMXB1eW9YQnlGdE5SWjNPbEJHY2t5?=
 =?utf-8?B?Vk5RVDdJL2tUU2RqNS9qQVdOaDB3MzQxWTlLMFdIK085UnkxRDFSOWpTWWcz?=
 =?utf-8?B?U2I2Q0syK0pJZWZXS3J2MTN1c2tZeHFqZEtDcWJhMUpUWFppcTlNdTdFaUl3?=
 =?utf-8?Q?8ada7f+KGAiYPWPTYVbRcr/l7OaxwJULD2KkJG3?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VkFWdTdBT205UGVhL0ErTnFTMzZ1dDRQK1N0TjAraktYVnVMSzZZUDNrQzJQ?=
 =?utf-8?B?MWdRYWZRckNpZG1aYjJ1YkVzWkc1eWdEMkZKOGo5d3lrYVNFcVZOTHlYUHkv?=
 =?utf-8?B?UnBWOC9WNlhkQlpvL1lmeFlWK0VSVEtKSkI4bkZrOExhb2d0TzFldDlzdWta?=
 =?utf-8?B?OGhxZ3hJZVNLVmFxb1ZLWGZSeGllTWRrdHh5T2JSZ2Z5aVFxMTlWL0tlU1JG?=
 =?utf-8?B?RVp3MlJuazVxWG9jQXo5NmtKQ3k4S2J3UXZaZnU0dWlDOCtqaTg0OS83dVFL?=
 =?utf-8?B?ZC9SaUVpNElHU3JKVE9LUlIzdjQyMGpRODZXRWg0Q1hGZFVOeUY5NkhVUDJF?=
 =?utf-8?B?REkxdHJhTjFtS2Zrcm5zYm9UM0RIQXlKSjJjcXFqUGErUU5LSDh4N1JWWmJy?=
 =?utf-8?B?RUt3TkRMS0hTMjVMRjNGWjRnL24xWTVFemNadXdocFlSYTcyZUE3Z2hFcUEv?=
 =?utf-8?B?RzdkTFpDRlpvcWlUQ0xhSnM2M05WQjlnMmRsTWtNTkQzVUZFMnlmOFdsRUd1?=
 =?utf-8?B?K0cyMmxHRkZGMWZ3d3JmUEdxM0NheDNRUU5FS21pNWhVVDJ5VWkrcmVyMlFp?=
 =?utf-8?B?UFkwaVM5cGhRWWMxMlhNRVgwV3U4dFpLMkl2T2c3UVYrWXNqdXlIam1uQkhY?=
 =?utf-8?B?TzNGN2pvMUlDMnZmMDJYTUY0R3ZkT3NNNWtHUW9GaUJkMjMyQmJWR2JvejVj?=
 =?utf-8?B?ZUJWNnhTWVZKN2NKL1NVYllTRXRnK2hOVUhEM0U4bHZLeEhoVHdkaFlHK0lv?=
 =?utf-8?B?bGZMdDZYM0x3YzJrNVJMeGdIbWRGTWFlazB5SnQveGs0Z1lhSHJwanNUNVdK?=
 =?utf-8?B?d0pldWVWcU52d29lMTlnZ3BQcjVGNndtL09ScjJMM1YzVXQ2d2dCQVR3ZFlJ?=
 =?utf-8?B?c2w5UDl4R0dCODlmcytQUVloeUR1UHV2dHYvQ21hOXlMUTQ0Sk5hYXpWS1lm?=
 =?utf-8?B?SVV0L1V2eTJWdjdZVDhSS1hMMHhvWWFSMkJPWGJHWnR0cE9xLzJId2hSNjFQ?=
 =?utf-8?B?YTRUZVd4ZUgzZGpCY0srY0c2YzMySUlNZU43dDRrREJ0R2JSTHpqZmp1TmVB?=
 =?utf-8?B?OTNrcWwrMm12dVZqUTRBMWxLTE9qa2NXdjlPNWlQazhSQ1ZLU0oyb3g1VjNE?=
 =?utf-8?B?eGY1VHNSUTd2WUpKY21TYmRuQVM5K0FwNGViTHJHWWhIaU84aUMyQjA5WFFO?=
 =?utf-8?B?MGJ4UytsSmphczh3SFIwSXB1cHk4cFcyYjZuMGI3T3o4aFRMb0hJUGNaeXdG?=
 =?utf-8?B?aWZlcTdDbDhHZUJ3c0xjRTJ1Qy9SanMwSTBxL2ZpWmgxdlNVcG1wUFBjR3d6?=
 =?utf-8?B?dU5tdSs0NGhWemxKdDRHWTRzSFo3YnVXTmxjbzVKWlJ2cUd5RG5HdkFsVWhu?=
 =?utf-8?B?cFhDMkduUmZFVjJIZ3Rib21LL3FaVVkxeXQydjYwN2VHWEQvcUR6NmdIQ0Zs?=
 =?utf-8?B?cTFENmUyd1dzL1ZHc1VJWkMybjFrMjRzdWxzYkxBQmp5eXNDN1ZBcHMzNG9F?=
 =?utf-8?B?L0NOVWhxRHVHczU4NkYwVCt4cjRDQjd5MTJwVVVFaG1ORFdGTCtvRERCN2hC?=
 =?utf-8?B?elJxWGR5THdiMnpYRjd6VXZWc1k0UGxNQ1BzN1pubWQyMGw1c0wvNllPVDFB?=
 =?utf-8?B?bm9keXZ2ZERadjBYUVZ0VWVHVWp5WDFMUVdqUE5RYVpxd1NJZWpZQjVNa3JF?=
 =?utf-8?B?VHJsZEdrYm5IbExsTHNWaHJLZVZFbzg5a3NUNmxPNG1iMXlKcHR5K0RhSTRU?=
 =?utf-8?B?dThNa1ZsaGQ2a3liZDQ2R2Y0d2FQUjFMM21jSkxXNGpjMjkwcTMxbnQ5dFln?=
 =?utf-8?B?OW5yRk4wVlcxcE1mc0FwSE1KcUNTWVZhekZBejY0N2wwK3NEbVFoSTBlNkFx?=
 =?utf-8?B?WDE0ZHZwalVwUnlJMXNQWXJmdGRCeDdiUlh0NjRmbkkwOTgwNmo4N2FFajhx?=
 =?utf-8?B?UEMva2d2RGdBNzA4YTJNcjN0U1VsMVpMOFdzdmkxVW1Ec1g3Zi9paUNkQVdz?=
 =?utf-8?B?R25iL0tEbFpLWTRWc0JHZWRKdWNZR0owOHJwSGw5ZFlQckxZUGlWdUNCNThm?=
 =?utf-8?B?dndHUU00VStZaVloSjFRN3BSNll4UThlSmUyL29zNVRCQ21qRTJEcTFmSVM3?=
 =?utf-8?B?UW9JSUgwUE9RRnRmanY0cld3LzA2SjdGeTh1MGtKL3d0S0tUOHdTR1c1dHFi?=
 =?utf-8?Q?bDl7peXlCB9n9QkgBnWinXU=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a2dd887-18be-4e03-b78b-08dd03ee1634
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 14:18:46.8723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Vo7fYtLRTrGBz+VkgGMZzr+FEDSVzsIfzIHOGUbbYgwRwpvtIjhKvXnG6x95c9w6r8RWSiK/2HNxMs1sBlnby4dBZKssN8BHdqw2n5p/Qc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9656
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 13 Nov 2024 14:19:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5728

Hi Antonin,

On 11/13/24 2:43 PM, Antonin Godard wrote:
> Placeholder files for release 5.2 (Walnascar): migration guide and
> release notes.
> 
> Define two substitutions |yocto-ver| and |yocto-codename| to avoid
> mistakes in the document. Note that anchors cannot contain these so
> add a note on that in a comment.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

But see nits below :)

> ---
> Changes in v2:
> - Add the missing "release-5.2" document in documentation/migration-guides/index.rst.
> - Define |yocto-ver| and |yocto-codename| in
>    release-note-5.2/migration-5.2 to re-use in the document (expect
>    anchors).
> - release-note-5.2: replace "over 300" by "over XXX"
> - Link to v1: https://lore.kernel.org/r/20241112-release-note-5-2-placeholders-v1-1-a15b66eae472@bootlin.com
> ---
>   documentation/migration-guides/index.rst           |  1 +
>   documentation/migration-guides/migration-5.2.rst   | 77 ++++++++++++++++++++++
>   documentation/migration-guides/release-5.2.rst     |  9 +++
>   .../migration-guides/release-notes-5.2.rst         | 65 ++++++++++++++++++
>   4 files changed, 152 insertions(+)
> 
> diff --git a/documentation/migration-guides/index.rst b/documentation/migration-guides/index.rst
> index e9d7f7280931ea6e9b26276ee70a9f9d00004450..14127d56ff397a37e4f36a2e368abcb54eedb8a1 100644
> --- a/documentation/migration-guides/index.rst
> +++ b/documentation/migration-guides/index.rst
> @@ -12,6 +12,7 @@ to move to one release of the Yocto Project from the previous one.
>   .. toctree::
>   
>      migration-general
> +   release-5.2
>      release-5.1
>      release-5.0
>      release-4.3
> diff --git a/documentation/migration-guides/migration-5.2.rst b/documentation/migration-guides/migration-5.2.rst
> new file mode 100644
> index 0000000000000000000000000000000000000000..c186f633d26853d8fdd45529f5f3364b79591df2
> --- /dev/null
> +++ b/documentation/migration-guides/migration-5.2.rst
> @@ -0,0 +1,77 @@
> +.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
> +
> +.. |yocto-codename| replace:: walnascar
> +.. |yocto-ver| replace:: 5.2
> +.. Note: anchors id below cannot contain substitutions so replace them with the
> +   value of |yocto-ver| above.
> +
> +Release |yocto-ver| (|yocto-codename|)
> +======================================
> +
> +Migration notes for |yocto-ver| (|yocto-codename|)
> +--------------------------------------------------
> +
> +This section provides migration information for moving to the Yocto
> +Project |yocto-ver| Release (codename "|yocto-codename|") from the prior release.
> +
> +.. _migration-5.2-supported-kernel-versions:
> +

Considering that we autolabel sections, maybe it'd be simpler to just have

Supported kernel versions in |yocto-ver|

here?

Or I think we could even do:

:ref:`migration-guides/migration-X.Y.Z:Supported kernel versions`

whenever we need to link to it?

This would allow to not need explicit and unique labels in the files.

> +Supported kernel versions
> +~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +The :term:`OLDEST_KERNEL` setting is XXX in this release, meaning that
> +out the box, older kernels are not supported. See :ref:`4.3 migration notes
> +<migration-4.3-supported-kernel-versions>` for details.
> +
[...]
> diff --git a/documentation/migration-guides/release-5.2.rst b/documentation/migration-guides/release-5.2.rst
> new file mode 100644
> index 0000000000000000000000000000000000000000..5c39b99e037e0a84ad6603d22ec4fb4dc2bf96ea
> --- /dev/null
> +++ b/documentation/migration-guides/release-5.2.rst
> @@ -0,0 +1,9 @@
> +.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
> +
> +Release 5.2 (walnascar)
> +=======================
> +
> +.. toctree::
> +

If we could control how :glob: order the files, we could simply have

.. toctree::
    :glob:

    migration-5.2
    release-notes-5.2*

but this doesn't order the way we want, e.g. for kirkstone:
- release-notes-4.1
- release-notes-4.10
- release-notes-4.11
[...]
- release-notes-4.2
- release-notes-4.21
...

We could write an extension for the toctree, but eh :)

Cheers,
Quentin

