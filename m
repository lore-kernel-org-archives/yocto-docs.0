Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E915ECCD199
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 09:07:55 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.35])
 by mx.groups.io with SMTP id smtpd.web10.13730.1760951265005557115
 for <docs@lists.yoctoproject.org>;
 Mon, 20 Oct 2025 02:07:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Jhk5hamP;
 spf=pass (domain: cherry.de, ip: 52.101.84.35, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VUjZ5ux4Lk9bcLjq76GI4ws1uOSf4icxMjG+H8lUyLLb04gXrEBqZtmumpVcaDaDUR4/MxNnafJX0gyiKdy4YLAk2Evc9pXS/OgNn3sfdTXyl0zewrZSH4Zf2B/AzQ+v258IFDBI0p3VkNMDJN+ztGIiRkwZYKVJrpkLuAzqWV2ABppjvSPWfXNIhSZRVvL24apxY8JUWR45t604x3HtJg9AI4Q6dBJrdW3X/yR1vVpBxERt/+tSHGn05V5OEG25yCrLiQivIfTEzUQD4PPRcGkO5iySNvYhRHTvDrGb3ajksdpI2GI0lrv6uP9xso0zY/ADmVgZhu4AqeJWGvd2Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HTjHamWwNYrRwK1KHo/aVTOFQ6z0aoLf2gOqLKC6arw=;
 b=E510fhDJnMsA9yOutYDHSqUx1DjCc5IBVM4bYjfq2t9jYXRrbUaLWbWqRUGkBwaoAcc5gCJEJECgZZRAufc8d/ESOXpELlRTD1KCBIWm6v1oxB8Eyw3hLJxuZIOfJPRfwenl3XfL97kbaEjNo5cL6e4xNy3vhRKqXTNnHBK5p/rQxQYPxYvVs81ziiHc+Wc+0wKR3c4PRMINTW/q+Z4oSCMylFFVj3CEz15hmHvDiAWVQ6G+fbsMsW5G7jBg3Myy8nMDSQQL1JJSqLawfOaZkhscqHnskoTMdBtjMr50FCn8vOmW12YLaW106JdjAJtycz2AJVSy1OJ8ZPf/X0dwwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HTjHamWwNYrRwK1KHo/aVTOFQ6z0aoLf2gOqLKC6arw=;
 b=Jhk5hamPBu/QIDBfObkzDDhswNbF8+9+PJN807dMUhYX4ivbeQADw4mhkHURTTFz6KPploJ1tk2xiS1QGoKgyC4KhlTH/iZNBhXpPo6cHYZpJuorGhJXA5ZzbMVoMUHCdCgWMA7Vo42eGMO04dfnlGnADTx+dP14WHFub3Z8XBc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA1PR04MB11455.eurprd04.prod.outlook.com (2603:10a6:102:4f0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.14; Mon, 20 Oct
 2025 09:07:41 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 09:07:41 +0000
Message-ID: <f29925d6-bf13-4b06-8cb5-a843244633c1@cherry.de>
Date: Mon, 20 Oct 2025 11:07:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual/variables.rst: fix a typo in UNPACKDIR
 description
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251020-fix-unpackdir-typo-v1-1-597d02a2c6b1@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251020-fix-unpackdir-typo-v1-1-597d02a2c6b1@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0035.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::8) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA1PR04MB11455:EE_
X-MS-Office365-Filtering-Correlation-Id: 239d95e6-dc46-4783-fcc2-08de0fb81f90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YWU1ZWFwOVZjK0J6Y1lPcDNHM2I3VHhNWG9FVDc5djVpckpiMFU5eXQxbmFv?=
 =?utf-8?B?Z05hLytlbzJlMDdGck5yOC9lQ2kvUjVKU1pmcThLWlZlOVVXNlNWSHNUd3N3?=
 =?utf-8?B?RGZtRUZiNHcydkxuV1FWdHZuVXdCQ0FjZjVod1htelNlSVBBc1FQb1FIYkJs?=
 =?utf-8?B?MEh6OXR0SzhZdnBoaU9SOFUrT0JabDZTZE41QWFGVTBVQ3UvNXpEM3NvdEFP?=
 =?utf-8?B?K09VM0U3RGNkVnRWSEpYbWpack9HN2gxUTFkL3RkY3JqTXdLTHQya3VSbFFm?=
 =?utf-8?B?V1JrWDNQcmM1ZXI4WElzb0Y3OHRmR0xyUWFHaytuU1JrZTVWbmpkMFBjc2dH?=
 =?utf-8?B?KzVFRG00Ym5kMmxvZDkvVldYNHhxOWtqM3lmdU1haXpFQXRQbVc3bU9JUnVU?=
 =?utf-8?B?ckVJLzc1Vmxzc2pEa0JtdXg3bkVPWEdpY2Y4ZkphZXdUbWJrUTRBcVFrWDk4?=
 =?utf-8?B?VU9MMll1L2xZcTJ1cmpGRUFnOXVxV1hxR1g4N2VmYThNQ2NhLzVPYXkwZk5G?=
 =?utf-8?B?RFNKNkZmL3F6U0lLUnR1ZXZFZkxUamZJdlVjQmJNK3JHUm4vNGZpM3ZmKysr?=
 =?utf-8?B?dWNrSW4xTTNnUFFScXZENEt3Q1ZBamxRcXpEQWd6djc5ZCtYUXd0QUZRck9H?=
 =?utf-8?B?Z0VGNGpaN2xTMEk5SnZoOFBLR29VZWI5emhqbm1RNUFCSkI0U0QzcTJsL3Na?=
 =?utf-8?B?MmRYd3pnaGtpTkVXV2xna0V0ajNBcE13V2gwTWhhT2c0ckI4NysvZnIrd1Js?=
 =?utf-8?B?MytFY1ZnZTNHbml1RGtJYTVxc0xpQXF2YnBIOU9POE9mdDZIZjl0QVNEWGFi?=
 =?utf-8?B?QXNLcDZBYktNV0Nmb1ZndW4zKzhRM2YvYXFrNVpqWDAwTU5zSFhiMm1NWUk0?=
 =?utf-8?B?b1RYVnYvL3l4RHpScDdSc0dqQ1hGaUxUSVN6SXBQa01qS3JhMnNHbFhUUGJu?=
 =?utf-8?B?VlFzRE1TWmsrYVFheWxXeW9vNHVaL0tLSzBwMUNnMWRwZnNvU2pWa3JZcnMz?=
 =?utf-8?B?RGt4ZVp1UWx1QmtaeU04VXk2UEdFRXBBV1ErWHpsM3dqN2c2YlVmSWJyL2k3?=
 =?utf-8?B?Ty9SaHAxWExYeTdkdWFlL0xFRWJDNjMxaU9Yb1lKR2UrMlZvUEhvODhoZkI1?=
 =?utf-8?B?QjU1M1RZZHdEbGdOMnUwaGNhdCtuWlBLZlNUNzl2cDRCelkyMnJ4L0FEdlRZ?=
 =?utf-8?B?RWw5eUpoM254WEIwb0E0QXI3UVlBbEcveFB1L3ZreUc0cXYySHJqT08wSmdF?=
 =?utf-8?B?bXBsMVFaMFZjdEt3b1prSHdabHlIdUZkam5lNEZQQ200SGE4RU5yL084K2hY?=
 =?utf-8?B?RU1WWENlVTFRb3oxS2tmaFJMOTYyQWpJdHB2cXlUUGZCMUZ2ZjBTVDFvanFQ?=
 =?utf-8?B?U0lyM2d6ZEhienBNSFQ5VktjaktLR0FRanJ4SlNndS9PQmgxc1hRVm5MTGlR?=
 =?utf-8?B?S1llZW0yVUJLVTMzZ0NGM1MvUjdyQjBmMnZkTDErT2M5VGg1WGtMOTZqcXZU?=
 =?utf-8?B?S3ExL2hSSzNRMlNnUmp5U1A4aVR4cUVFTVkyaFRqOG10blZEWm12Vy9kQ0k0?=
 =?utf-8?B?QUdvcWN0akp2T0pWRGtuUERMREhsZ0ZQcjN6cnp4VURjeWNXeUxUK2NPOWJw?=
 =?utf-8?B?dFhJRkE3UDZTNUZGRlROM3JKZjN0UUNRZlI1czRCL0tEYjFuemdVdzV0T1dn?=
 =?utf-8?B?MHN4U2c0WVVHMnBMbGs1RkVNRStDRFNOQTNQL2xEYmZFb1ozQVg2aURPeU5n?=
 =?utf-8?B?SVRDOC9BYkIxWE1zcGl0MmcvRW5XcjloZWQ0ZkpqZGJqc01pYW5DMGpONFhB?=
 =?utf-8?B?SGJMcEVoWi90UzdtQWtZNm81SytadXNCRS9UcnNGeDBYVzVzVnRIVHAyRW95?=
 =?utf-8?B?QWwyM0NBMlNSdXFOYlhld0w3cklEVzJyT2pWS1p3UzhvZGFOTWd5Mk9OZTdo?=
 =?utf-8?Q?H6p9Jd3ooMR+V/j+Ysi81US5vhUUC/NM?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bXJDb3czVVZmZXVuWGtZditHTGFNRjlQNXFyN1cxaGRhdDlySTJnUkV3NWFm?=
 =?utf-8?B?ZlUwNU9vQTFxSlhHK3FVQ0N2OEFEb29GNG1VMGxtTkJpejNDR2Y1blA1azlw?=
 =?utf-8?B?U1VPSDZrRlkvUitsYnlDeDVNRFptUEtTK1dRMWRWTlZzbFlCVUhzWHRIcGth?=
 =?utf-8?B?NHY5WUJ1ZTdwUXlGMy9keXdCRjZzYkFlRXF2RXgrVmFBRk9jdWhWemZnZ05o?=
 =?utf-8?B?TnZRRm94VlFKdHV6WDV0Vlo3ZTVBVTJqN0FLV2lIYlFOWVBwL3ZtOG9DdFNa?=
 =?utf-8?B?TjU4NjB2aEpkSkxsT3hCa3lhWTBXaG41bmJKbWNjZHRGVktPdnpnMEtoVCtn?=
 =?utf-8?B?cmQvUG8rYkl4YWtCVXlrZzl5SC81M1pMVGVRMDUwTzJlL3pxUzY3Vjd5VGxI?=
 =?utf-8?B?aFpNK0N3VnFuV3NnSUZBSmNOa0x6cWZwMGdlQS9GUTVIYlFuQ0tIV0ZiVkJJ?=
 =?utf-8?B?d3FzRVFkcTlkYnJZTGpyL0graW5MMzRaeXRaQktGZnNxQzl1Q0ZSbGVOVXdM?=
 =?utf-8?B?aG9NOGZpNVpHN1E5T05uaEk2bTc1YnBHanlpS2dGUkNobXkvK3lXdGNRZXd0?=
 =?utf-8?B?U3p0eUlCYUpSSTB6d2xZd1Y5NUlBdVlEYjJuaHYwZ0ZwbWlYS1NtVXAvaWVV?=
 =?utf-8?B?QU9GMGdVeVdEaTlJNnVTMXkzUU5LZUZWU09maWMwclR4Z09IdjZ1SFQ3MHZv?=
 =?utf-8?B?MTdQQjdZU0xETkovdk9Qbm1MUVVvdnRseXMwQ0Z1d0FRaDNONkh2K3RaNktE?=
 =?utf-8?B?ckJ4UXZOOGlNb1JHQmcyL05aTXkxRXp2K1B6S1NhRnVlWXJPTlg5WnUzd0l6?=
 =?utf-8?B?cXVaTmRsd1VWSW85a0VUTFBOckdodHVxUVJvZmw1N2ZhVDZrdWJaWmJuMDlU?=
 =?utf-8?B?NUw1WXc0MklxRTVrRGVRbFV0ZTYvRTdkbWRRdUZ3Q3k1V3NjZ3h5TWNlNUxQ?=
 =?utf-8?B?UmdtNUhRczJXRWZ0ck1sWko3Rlk2Zmd2MmZMaW5MMlNKZWFwQ25ZNEVuTTB1?=
 =?utf-8?B?SDFXK1hScU5rMnIzM2NONmZqZWIzNGdzSkxWbGxGRW4yMEo1c0g3WUNqRy9B?=
 =?utf-8?B?Y0g3ekNKZGw0Tkw3bWJrdGZLNVpYSkpBTVBFMHdpS3JxUjgrRU45c1VibUZL?=
 =?utf-8?B?NTk5WVJpMHJxM01sUFR3YWh0UGh6TzdSSDlHbHZ4QzJqYVhFbGtWRlVJdjZT?=
 =?utf-8?B?eUJYTmtRTHE3eldNOGhEdFNKd0MyZXhXK0JYU3M4TzFaL1c5bWw0TWQvMlRF?=
 =?utf-8?B?bEt6SGpwaHFaNkFYMmJwVUIwQlFiQUtmY3pBQXErbG9lZDYzRVdWdVZ3K3Fk?=
 =?utf-8?B?NEZJRUV0VXAyZzJLdkdjeHV2alNzSnd6c09DcTc5bFhaMXpUcnk4Ui9DL2o0?=
 =?utf-8?B?NHZUNDJ0NjJpM1dDUTA1SzIrLzhUZHRYU0t5emdwTHpsRkNwRGQvR05Ha3FZ?=
 =?utf-8?B?Y01jVkNHMnc4ZkxaSjZkTlNTSEl3UkRiNkp0U2NsbENjTXBWTmc1eENGWDBE?=
 =?utf-8?B?RHFyNDRRYld4SStsSXc1QTBxVFBhYTA0Sm1sNityWGJjVTVGQytqckRiZzg0?=
 =?utf-8?B?WUh5UlpxLzhHdzBBYXJhbGovazFqZ2JUWGxGTFdIVVJycEV0T3pJQ1EvQWw2?=
 =?utf-8?B?ZEg5SkMyN2pWblRQZFJ4d1YySE9IaGlzeEJxNHFxZW9zQnllVEZuYm9zMjZs?=
 =?utf-8?B?ejVpNkdHY2p6VnVVS0pUUDdya1NxMEN1Nnk0NzJ3b0xta3dCQ2w5L1pqYzdi?=
 =?utf-8?B?L3lUTTB1Yy9RazNkM2NmQzA5R0dRajlkTjh5Vnc5dzh1WVZLQ0M5d2lvTkNQ?=
 =?utf-8?B?RVdteHp4YzRrQWs1M2FwdDZIOXlHUHo3RUNpTHlKV29xajZYS3NUY2dJaDRt?=
 =?utf-8?B?NDQxYTdRdVpGN1RhSlZZRHZqWktyVnc4YVc1SFJUU1J6S3VhT0J1K1lJREp1?=
 =?utf-8?B?SHNEZzhaV1FndFBaaXNvZ00wcGs0N1p4aFlmemxTUnF4R3B6Q28vRDVPdGdH?=
 =?utf-8?B?Uy9wM0M5ZzVzWWw2ejV6c0dXOWgvbDhQYnB6UWZjYkRkNWxMbEFvVzYzOGlS?=
 =?utf-8?B?K2piSFRXR1FFQW5Ub0pWZ3F3SlU0WDQwaUVoQ1VoTzd0K3p6M3JwWTcrWUhq?=
 =?utf-8?B?VmpCdEVvazZLWFk4cU4zemJVNFB0VEhSeFM4eEhuSjJpc2NaWE1Ec3EyV0N4?=
 =?utf-8?B?dGc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 239d95e6-dc46-4783-fcc2-08de0fb81f90
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 09:07:41.3288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LTLSE4HZsBL/o6lsOnuP7efp0/uNF/jrRBuj0rvOajeeehmngpnDDYqPgzZ6BXKD4CNV+iFymdZnRb0cHPCdhly+FhLrSoMepj33arsmcoo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11455
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 20 Oct 2025 09:07:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7756

Hi Antonin,

On 10/20/25 8:49 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

