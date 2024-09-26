Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3398CF9C7D
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 12:48:46 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.65.40])
 by mx.groups.io with SMTP id smtpd.web11.42068.1727354916902907897
 for <docs@lists.yoctoproject.org>;
 Thu, 26 Sep 2024 05:48:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=R9k7MD/A;
 spf=pass (domain: cherry.de, ip: 52.101.65.40, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bmvoiA6LoSBebViOwSXUa4KX9eDQNLU+YljbXgzZ8kGwsGeDq5Vl5KYuSGN/6SUjQaZY0pN4VSJXqzgzDpyuHhm+whdJ6V00jsh4SZ+mUf9a94Unp5tEBo/SwXeJKeQ0fANf+diw17YEIafQ/IctEAfHtbSe8fvA3kBEd8lvT3JwDKkvRSMLbLRr3ufKIxU1y4byDdFv4+7ZD1vUOvsrvJtbbnY26olXvP0HLVp4V6P+OYwDusQ29EceuvZwdLIXOrZbtsuaVsVABOOVk8C88XTBz5xpwGPxJh2vWHChY10U+PXQWiLADY3+XK7PIB7qEbnbpInqzSrB+xI7TUNyUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JfI0+msAcjzAIojuFki4tU00H0anEZsXXZ9BXo4MszA=;
 b=J+NVapPJSl6cGIQJjQ8e0uR+p7N+ygMRQHgH3gAWb1SY8tf48XNHZzn8ANgGs3+sp90ErSgW/s6L9rTpxQJ1VCM6+Id549pGvDF52ppRxWGsnNHxONyTi0jqcuNlpEhTNM4RSUttbk/X9XyO4aPB+ecnzncvzjBmyZ6gf6b8tdUsUwqUDadNK7HsrhIIDMQ61LiHHV9uuU/4oiqg/UZvTn6DX/K1t1DWYSqDxPFrb6H711YZw4F1MkLcn7R8N5r3hPEyaztiPHdcCqzlJhiC7ooCeAbIgLynNAoQx1pMq3BbhEhuB0K5jIbjS+vdh+xOwvMawrpyzkb7j+dA/GuYYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JfI0+msAcjzAIojuFki4tU00H0anEZsXXZ9BXo4MszA=;
 b=R9k7MD/AVgBTgsaA+1rV40dmYh5jHng1kYX0xPTA3h2mBim2w57CDB+SGFaklLcKpnDx64mYGXA7jT66Bt5RVcicLeutXPlxKHn4731yoo4SQsauIDEiovHGrRoq9fYivfsrK+ieNND/FEWfZrQkV1hVZnspbL4sO+ixuT0BZh8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by AM9PR04MB8226.eurprd04.prod.outlook.com (2603:10a6:20b:3ea::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Thu, 26 Sep
 2024 12:48:29 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%2]) with mapi id 15.20.7918.024; Thu, 26 Sep 2024
 12:48:29 +0000
Message-ID: <04e2ee7d-fafe-414a-9b06-83d93680a15f@cherry.de>
Date: Thu, 26 Sep 2024 14:48:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 1/4] migration/release-notes-5.1: document
 oeqa/selftest envvars change
To: yoann.congal@smile.fr, docs@lists.yoctoproject.org
References: <20240925132017.3427438-1-yoann.congal@smile.fr>
 <20240925132017.3427438-2-yoann.congal@smile.fr>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20240925132017.3427438-2-yoann.congal@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0005.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::11) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|AM9PR04MB8226:EE_
X-MS-Office365-Filtering-Correlation-Id: dcfb37c5-de1b-43dc-67e0-08dcde298560
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZEtQY004bGx6VFNqRVlzY0tzRWJOYXJUZWhHN3VKK0xCMjVoSXZ3aTJIVXc1?=
 =?utf-8?B?K3h4VGhyWC9lZFRNS2J4eXJzS0VBUjVuNkNlUisxNHVVYjZHVXRQcjhZOW5E?=
 =?utf-8?B?MGhhRzN4NHhEenVsajh6QW03aUMrV0NzUWdhUmdsODk2d21ZazNZdzM5Wlgv?=
 =?utf-8?B?SmhoL3hKOE85NW5MYVgzeG14d3J6TU9VZG9qMmtQZjZVb2swSldqSGZJUWhk?=
 =?utf-8?B?VWZyN2IvMTUreTdneGRHWWN6Z1pJUFJVNXFnREozWFplYXVqemt4Tk1aVnZq?=
 =?utf-8?B?T2xLN3p6cGJaRDRydHNjNnhpVjkzRmg3WDNCMEJXdmR6MDVJWGhuVlRvcjE1?=
 =?utf-8?B?L0JTQWtjU1krNHhIS2JEb21SU3ZRcnhvcmlPTWRLdU5idWZwWjdhd0lNK2ZG?=
 =?utf-8?B?eU9Jd001Uk1TVVhlemVkdVF0MWlqeTBsZEQ4OXBGK09HNjk1ZGhxbEtWV09p?=
 =?utf-8?B?aElyMC9KVVg5c1d6TGhkSGJCNWRFNmV0K0E5VkdJNmFjbWpTNkdPckFHNlRl?=
 =?utf-8?B?cmtFU1A2Mys4TzFscDJYbHpuOXpsWFJ1R3lvSEdDblpZQjNDWkVMaXIwZCtQ?=
 =?utf-8?B?cUQxdm9DaVpmeU11UDVpdTlCRlh2ZmxDMWZiVEkvNUxYOFN1NlpYMEpvV05M?=
 =?utf-8?B?cERXbGp4RE55WC82dVcyeHZQQi8rTmF6dXlid0NFU1pyaFU3bUNpSGE5Ykgv?=
 =?utf-8?B?c1hRZHFKdlRZMFZnUDB4ZDBSWjg2VitYMmdkSm9IL0N6MW5Odi9KMGRzbEpp?=
 =?utf-8?B?d09UaG15SENWNTRKbGEvaitGbEYxVkNNQW5aa0NoQURZRDZZakt5eDZLM1ph?=
 =?utf-8?B?aUpiK1paVzd2eXhOeEFXVzRvUTVBbThibm1LSWVXT0VPamJmSkFTSlpPM0Z1?=
 =?utf-8?B?Mmc3L25sWjc0WWZiUHVVUUY2SHpmMEp6TU5xam92M3NUdzZ0WFlZUlpsbC8x?=
 =?utf-8?B?NGVsRHN3VmtQTlcwOEdFekFha0NBa2lSSWhMdVlTWWVSOEhoSFJ2Q0Z6Vlh0?=
 =?utf-8?B?Q3dmUDVUclY5YVI1dnIxN3hOdUx1MGt4VDJwRXNSOFdOQk9pVU5Id0NxZkRv?=
 =?utf-8?B?N3JnNUtaclFlS1d6cHhkZWc2OC8xRk9haXBra0h6MnZvanoxbG5ITkFqTGpx?=
 =?utf-8?B?Q1BPZ3NGbVFsdEo5ZzdDVjJpZjlMdjVRTEpmelNtbWk2U3FMTWNxWHJrYVFQ?=
 =?utf-8?B?YTJjVCtwMnJ6U0pvZjY5emRpbHBwTDhKWlpPKzBFNEFQbWxYRWU0N1c2MEhI?=
 =?utf-8?B?N1YyelEyNXE1UGlNVlR2aHhXWlgrd3NCcEJ3TW9PTU9rWlBaT2lwTEhPLzFl?=
 =?utf-8?B?dW02QXpSS3M3VThnZUZCN2JzSFp6cldsK1J2Nkx4TnhkU1oycTd5b0RZMjlt?=
 =?utf-8?B?WmRwQW1QZ2FxbEo1QlBPK1BaU0pKRGtiODJLY3k4N3RETlV0SkQ1UlhoQnBk?=
 =?utf-8?B?LzVMUFdQYUVKemZxSU54N0xrM25iSFdwVU1xdkFQZFVxajdIWWhjMGU4K2pP?=
 =?utf-8?B?c09CNjFHUFlHd2hnUlFuaHpTSm1HS0pDWUlQQ0VFV0J1TjFXSytrRFV2dkVB?=
 =?utf-8?B?c0FoYmxSSU8wWi80VXQzd1BvL1lYT3Q4d2l0eHRzdGFSY050R2pVZHN1MTQ3?=
 =?utf-8?B?M0k2MGRNd3lzd2RXL2Y0K3NHN3hrczhPWWdOWjlyakJ6cTlRcmRwdEZwMGlz?=
 =?utf-8?B?RFB4clEySVZ6cDFMVXJ4ODJMK3VndmFMWUhmdVcxSklxbVY4UHp4WG1zZHM2?=
 =?utf-8?B?cXlwMHJmNGZkczllVU8zZTN4MHdpNzdST3h6Yi9YMEE5NktLOGdNMDRmVmk4?=
 =?utf-8?B?blhFRGlhT1ZtU1pLd3Zrdz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NjNuK3BDaWptbWNCWGw2M2Y2YXFLUTYyYkpOVk9HTXFPcXhnTFpuNlRuSGxJ?=
 =?utf-8?B?Y0M3amxReWZNNDVHYWJVamkxOXVtclVscmlad2hTR1N4aGprS0NLZ291QUk0?=
 =?utf-8?B?ME9mZG1UYkYxUlpkV2VnbUJMb3lZazRyZHBvWHErTVVpNU9acVJMWUROSGpm?=
 =?utf-8?B?Z2xLZjY0RkRHRVdNdjJQbmR3a2czRTJWMnZMN2h3c2tPR1NkeVNId3VIQ3o0?=
 =?utf-8?B?UWpxQ3dVcW4zbFVlbjBrR2ZkRFAxUTFsMnViN0NBZDJJMEJKVlpHbUxoa1Ju?=
 =?utf-8?B?WUdlaitOQUdDczgzdTI1WGFzT3BpZVhTdkZmMDJDdG9qWjNHMHp5ZkFDd05q?=
 =?utf-8?B?L3VPNk55UTg5cTNIM2NqcUtTUzZpZEdWdEFUSTBNN1dkWkg3MjJzZDU2TnNy?=
 =?utf-8?B?OXNMYmN0QkRnbHk5OVRzNldnbWVEZXJDZlJ5YmdHb3JodS8yQVZIeGM4bTRi?=
 =?utf-8?B?SkFMdjNoUHJOS1YxZ3BzUXRiM0I2cndSTytHQzRZNU1lbEU1akZ5Zkp2Ymh0?=
 =?utf-8?B?UlIySFpMRjRleUo4WnM1MEtOcE1ac0ZNc2pnKytMcW04NTl6a1ZQQThkbmdQ?=
 =?utf-8?B?MGFwNnlTeXhpTGJZSXNYcWYzRXUvcE9CalNhREhySW1pRDN4UjhNeFZBbHoz?=
 =?utf-8?B?TjZ1U3FWSUhSa0FvbVREd2wxNnFkbFZzdDl0ZVN6UUpjb2NidGlGckhPKzlD?=
 =?utf-8?B?ejZaSXZabDJ6Ny9nc004NDg5dGxMQVZFam1PZkRub3N1RUJwRkUyZTVFaHNw?=
 =?utf-8?B?ODJPUTlGR1R6elZGTUx1OXpyNHZFR0NXWXNrNTJHdDJuYVExU0NXRm1yZGlr?=
 =?utf-8?B?Z2pGTW9MMEdqWDh4YXpsTnNJUlA3QWQ3ZG9yM0xQN3NodXM3ZjlIUVpWb2FP?=
 =?utf-8?B?OFovNE1leHRKR2M4bVlyTGNzdmR1RlhaeXBOZWs3d3ZwNUUvTDRIWENKNmpq?=
 =?utf-8?B?QThSbEMxZWdDMWg1ZE5nVm1BTEQvWXFVZkRHcTBCdEpEQjYrV0t2SDA5cE1Q?=
 =?utf-8?B?anZyRzBZTnZ5dTF2K2xNbDFGNkk0OER6TnY1NlRncWUrYU9nNlRDS0YwYjFH?=
 =?utf-8?B?bW9uRUlLVG9wMmhLUWU3RFZkRENVa1hTSU91YW5sL1pQeDlpM1hoazVmcFFY?=
 =?utf-8?B?MlB1YlNHR0JWckJoL0l4UmZlU2NNWVVrRGhKMzg5aHpreXZPb21PZGdZY00x?=
 =?utf-8?B?L0Nhby9TNGhjYVZPTmg4bVYzTU1KT2o2MDdNcUg4SGlmVnpEN1AwN2ZWNDJp?=
 =?utf-8?B?U1FpeEFwc3VDdWh6M3g4Q2tXYmVqUzZaQy9qakRUUjlsc2VpOGFkb2JhZkc2?=
 =?utf-8?B?M0NwM1JHN0hiUGEvUVNXVnI2Mm9IdS9tNlN6UTJnWVcrdXNPMG5Uc1JaZllI?=
 =?utf-8?B?Zy9TMStnRFhObGplOHJKdno5UDRwSVlIdEgxaWNQQ2VmcHhLSlo0VTE5ZStU?=
 =?utf-8?B?VlVUN2N6bDdyTUt1M2lrcjlaOEdXMGRFczZJUkUvdjcyKzl6WW4rcU9saXAr?=
 =?utf-8?B?ZVdscVZLQkJNL1gvWWZPZ1JKb2NvalhkZlRrK2lsWndsZ1Q0c09iQW5Tb3lC?=
 =?utf-8?B?Si82emJyaUVGUjFqVFNNejNlSElRdEhRemJxN0ZDUkFUMEVLK1VxRGhOazRt?=
 =?utf-8?B?WHB6cGtBK3BPVjN0dVNndjh5cFVWSHhVYWc4ajVaZHVBdld4aGg5WjdiSUFi?=
 =?utf-8?B?dVVxUnlJYm1EV1FUQ2lMWkZNelRodlNkQ1laWjVrTWdoV2lVWUFWQnd2Qnor?=
 =?utf-8?B?YTlwN1diUVhzOEdCeWphTDRuci90YTBXREJkbXphdmcranB6aGxnaEdpY3NH?=
 =?utf-8?B?cmd0c0VycEpkR1RERG51dlJQZHVEVWxzNUV1TTBXb2xvS2FreStLd3BKTENi?=
 =?utf-8?B?NGVVTGRwSlF5ZnVqbmorRFZFeE5iOXYyNW16cFhOZ2VjSHg5QkZDOVN5NUZw?=
 =?utf-8?B?VlBQblZZL3ZsTk5wTjZRdkU4dFFvbkhraktaT2hIanN5RzhmUHM3M2ZZbmdS?=
 =?utf-8?B?S2xyZG9NQXJhUFZUNDdrMEJ3dzFxdW54bU1VUDVlWXlpSHZKcnFmK2hrV3FK?=
 =?utf-8?B?VkVzNTdzYXNQblFHMkNDZThHc2RraFdtVEVqMmZqUndUQXBtbjdUWitnVEtv?=
 =?utf-8?B?eGFuUmNIeU1YUXZuYUF3ZE4welB1bVVhVGlmZ1RTSTdEM2ZFZWVuSUtGNzVp?=
 =?utf-8?B?VkE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: dcfb37c5-de1b-43dc-67e0-08dcde298560
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 12:48:29.3908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3NGAmGdxnFptxgVauBvBxfKhadvUtU4RnHIOlLcKSk+WEqCYpz8+suxqSuNBzJFo+P9X7yI1iq6Y5mydT7YF9yfgA8clP/S2dMl+Mrm0qRs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8226
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 26 Sep 2024 12:48:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5374

Hi Yoann,

On 9/25/24 3:20 PM, Yoann Congal via lists.yoctoproject.org wrote:
> From: Yoann Congal <yoann.congal@smile.fr>
> 
> This covers the Poky commit:
> 61186bc98a5 (oeqa/selftest: Only rewrite envvars paths that absolutely point to builddir, 2024-09-10)
> 
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>   documentation/migration-guides/migration-5.1.rst     | 5 +++++
>   documentation/migration-guides/release-notes-5.1.rst | 2 ++
>   2 files changed, 7 insertions(+)
> 
> diff --git a/documentation/migration-guides/migration-5.1.rst b/documentation/migration-guides/migration-5.1.rst
> index b43fecc2d..14329c6a8 100644
> --- a/documentation/migration-guides/migration-5.1.rst
> +++ b/documentation/migration-guides/migration-5.1.rst
> @@ -141,3 +141,8 @@ QEMU changes
>   Miscellaneous changes
>   ~~~~~~~~~~~~~~~~~~~~~
>   
> +   -  oeqa/selftest now only rewrite environnement variable paths that

Maybe it should be "rewrites" here? Not sure though.

> +     absolutely point to builddir. Environnement variables containing relative
> +     paths from tested build directory to outside of the original build
> +     directory may need update as they won't be changed by selftest.

s/environnement/environment/ for all matches in that paragraph.

I'm not sure what I'm supposed to do with this information, it's very 
vague. It's part of the migration manual so I think it would benefit 
from being a bit more explicit, are there some precise examples we can 
provide. If it's a finite list of variables to watch for, it's even 
better. Otherwise a few examples would be useful? What do you think?

Cheers,
Quentin

