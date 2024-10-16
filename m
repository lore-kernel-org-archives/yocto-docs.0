Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CCF4D1AD5D
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 13:44:07 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.63])
 by mx.groups.io with SMTP id smtpd.web10.23203.1729086243623855647
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Oct 2024 06:44:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=ipXYGquP;
 spf=pass (domain: cherry.de, ip: 40.107.20.63, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n14tSUL87EPKFYhX2JUgk3p9vQqpkP2Fj7dNqjr663EzaAXzrKPoEObvzz0XWVF51ASfIX/eREHra0oymXGBMRuQaIa3pvoxQ/czhtENAZFu4cKlFt1XMVj0X/o/JhZ8LMXHrMMrUsc1FvhkAsTLx4qCYS1Zms0vZ40BevXv6rW9Gqs8Mz6vRVKFYxNyIL4zd2qSfXM9dr2lzfEncUPBm3nza9ITkxm9NkEAHZmL6YtpznM/k/03FvqCpNpV+xoUE1X7SrCMZOkCekyFi8OM8YY7NgpYlXZRpmGHaM/sfMftz7XWv7NFOFlkxBVHPT0wcFrekEsYpGfcUnSHt3N0Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LMtJP8vmcttRXUXcDOYRXU8N16U4sUs5hsUUieKfUyE=;
 b=WpPSQu2z0vxSNN3bU7+sIRJ89kKj2Dgg1G2GVQ5H9EEFaJM013xfpPq/khA2RRZjJxCIOH2Hjx0+5nEwwSiidPjLkpvUZ5BtdURDmfGvFwL/NUlOq7wcHnNP7GxT8xXLT0ob2hOvec34UoqmxAkwrGa6VJyiLsZ9B5LR1M/vJPt7pTtOVMz6A7tjBoQkVFulZWLdDJW54LfMorgPe1PK9VihTDfPdOzPh9DnhStur2Mc7WDYxiqIU0oXJ++aQ+PSWOIvmu0ftzRUgcVhtfaXmVHdW3Bz6mXWw7RD+TL3ulBEPETruiQUglTJHrUBIj4J6mVswbndcsFqtFtGQj5WcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LMtJP8vmcttRXUXcDOYRXU8N16U4sUs5hsUUieKfUyE=;
 b=ipXYGquPEXXrrQ17zroyBXKqUHZwoHOCmvQiMcUMWkUbEj3RX1Cksg/Yx5EryN0DP9jAFBBn3+CEKsCi1W31GJhxChEFMPdtroXsPW2Jf3gIT518PT811Ggi7KnFALDUsphKjEmMbyFguhbPwH4/x2xVFktnlxplIvy7Lv9BTuw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA1PR04MB10673.eurprd04.prod.outlook.com (2603:10a6:102:480::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Wed, 16 Oct
 2024 13:43:59 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8048.020; Wed, 16 Oct 2024
 13:43:59 +0000
Message-ID: <3e73992f-29fd-4278-9927-3929f4554195@cherry.de>
Date: Wed, 16 Oct 2024 15:43:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv4 2/2] docs: Replace VOLATILE_TMP_DIR with
 FILESYSTEM_PERMS_TABLES
To: Niko Mauno <niko.mauno@vaisala.com>, docs@lists.yoctoproject.org
Cc: antonin.godard@bootlin.com
References: <20241016115443.2751525-1-niko.mauno@vaisala.com>
 <20241016115443.2751525-2-niko.mauno@vaisala.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241016115443.2751525-2-niko.mauno@vaisala.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0084.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::6) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA1PR04MB10673:EE_
X-MS-Office365-Filtering-Correlation-Id: aaa30f52-5af9-472d-23c5-08dcede8967d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|10070799003|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dkZ1KzU3T0g0ZVYwT1djZXAvNXpHUFM0YkpqcDRidzdaamMvcGJibENDRERh?=
 =?utf-8?B?NmZaWmtQNTIxRCtWa1hYNGVpMEpoa0hKdVZHaGprVzVlb1NaWmF5SnpjVU95?=
 =?utf-8?B?MFFGU1NWcVVBM0tWMlNsalJYdUoxM0FQRW9BUUJBdEZ4UHl1MTY5K3dkK3B1?=
 =?utf-8?B?aDV5bkJwQWdwMFByRWpjVFRoRS9hem9uMGwxYjczaXFBYzJXdDZqaXNFZ2V6?=
 =?utf-8?B?bmd0OHZCR1p6YVlPbWRDUjB3MEdrYjVENGRoNHArdnE4Y0sxZHJGanJFZC9k?=
 =?utf-8?B?MHJic2VxQ0dHRGxUOVIwTUxJc2xZZ3IvTi80d2pwT3VucEpLUFFWcUlvaUZX?=
 =?utf-8?B?QlV2RW1zVFJoMUJZZ0d0MFFKRHYrS1J0QkYxS3U2L2hXN0tYS0lWTDR2N0Vn?=
 =?utf-8?B?VTFGR09qZFIvNGV5T1I3R0Zoc05oZmYyTjl1YXRxZStNT0pSeERRY09mS21Q?=
 =?utf-8?B?M29seXNnMlhmNXJkbHk3eUpkYmo5a0plaCtNL1ZkWGtrSUZsKzNYQVM2YU5H?=
 =?utf-8?B?NG9zcDg1QnhVTzJaRlMydFlJeXcxdGJEeWNBQllTMU9rYmtlRVBpWVdDMUVQ?=
 =?utf-8?B?N1dsUHh1Y01TRjFNcHBmbjN1SzREbkVNOHRld2FxOXlsOU1JNUNFZWdLek1q?=
 =?utf-8?B?a01zZi8wSitMcm1HSjFLaTY1SEpSZWJGVzhzYU1WVU9NSDhKNDJLcXBLRjcr?=
 =?utf-8?B?bkxiZ09DQWx4WXdoUU5SWEt0UVh1anp0b3RqRUdOUDR5U0M3cVF5UVVhMzRk?=
 =?utf-8?B?S3dBdWI3Yk9Jeis2QWU4YVJVb0ZFTG9Fa3Btc1NNR3FjcXZQSTl5OGdIWHRV?=
 =?utf-8?B?OU95dlJEQjRJL3g1Qm9QOXVFbnhEV2tJOXBWMXhjQnh3cWlxZy9jRlprWExr?=
 =?utf-8?B?dzExd2dNNzROWFk0cWlocmIvZi8yNzFuci9YSDZaYjFkWnFqVXFyUkk0MmZC?=
 =?utf-8?B?RlR2ZW05TVlNazVKaGpPd1JzSDVBaWpLTG5nalhjdzhCN3VMSmRveFNYb0Ro?=
 =?utf-8?B?QnRHaHFoUkdxNTBlYVUvME1tdXlhbGJXU1RSQjBHVnhQTXBNbnRXQnFOV3hO?=
 =?utf-8?B?YU5QWFExVE1hVWhTWUFEZnZ4Y0ZKS2wxUlAvcHlldG9NQkNZYmlKbk9VU1ZD?=
 =?utf-8?B?Wi9oRVpOSkhJVHo2ZW5qajBMSmxwaTF1SmZXRmIxQkQ3VWs1WXdoTmd4QTlQ?=
 =?utf-8?B?YVpuTW8wMjhVV2ZKVGIxSFI3Y0FxTkVKVndKbXQxa2ZTeklybmQ1ako5WVpI?=
 =?utf-8?B?c3p1RWJkdXZuREhBZ2dieWIrSkZqZlh5clNqTVdXNEt1N1g5QVFyVXlzS0JH?=
 =?utf-8?B?dHpwa2ttaVd1UDdvTFVJaWVxdU1tbCtZamthdjJMUWF3ZzJ1djZzL1pXeExJ?=
 =?utf-8?B?L0RiQjR4Z2U0elFtOHAvaEF0Z1NsUWpYWCs1UlRNK0pqUkUzLzZVaEptbTlY?=
 =?utf-8?B?Mi9GV3E0WEF6VGphRFE5S1JrMG9LSWtSTXpMK09rekpQZzFhWVdlNDYwdUkw?=
 =?utf-8?B?M1dDZ3N4RkkxVExHcFNlOG5xbTVxWHpiU2RCb1FsSlpLNTNuMStyRk5zWlZH?=
 =?utf-8?B?emNKeWhxQUFKamNEQVF1RDd1NHZsTHpKeXpyUFJQRmMxMDdqekswRG1MR1Rs?=
 =?utf-8?Q?y53oUCeJlUaDylJn3fKza0aVHrDjQ7wiO63j9KTtTj0E=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZG9CdXZCR0tsSEJZOUhZaGZDS21oOHlMN2JKM2JaSVRvRVFMbGJaL1hJTHBk?=
 =?utf-8?B?S1MzYnRvd01tMFBEUlZaSGkvTW9BZEJhSTIveUMvMnBEQlVvclFoVzVIYnlr?=
 =?utf-8?B?bmkvcm9JSU9UcFdab3JZNjhHam1iSWhqV1p1d0pLZjE4UGtRNFpucHpiUDJy?=
 =?utf-8?B?T0paVjhSY2tKQ0hMTEFFYjk4ZDYxdnI5d1duWno0bWcvTkRFQmNxampLc2I1?=
 =?utf-8?B?ZmovdERMTFM2dUoxY3N0b0xVaEoxa2RlNEJEajVaRkc0MkxRR2VsVVRWdDRU?=
 =?utf-8?B?ZXBhQ1hCS0JoaGRsNFFxaUdHL1NpQ05DZ25xaFNBVXNqK3FrNDk3VUszZDRx?=
 =?utf-8?B?cmpveWVCN1hmUWtVQlJ2RXg4Ri92dzl6MlhxakdKKzY2QS9DdEwyWW52N1da?=
 =?utf-8?B?bFFVbHJubGJoUzY1ejJyRVJqeFFmNDJVZmZ4aDE3QU9tSUV1c3BZTXMwa3JU?=
 =?utf-8?B?WmVpNnB3L09YT0VRMFdGWWttM1BNcFpmVE1IZU1qemVhanJKSHlYUVRFT3Bs?=
 =?utf-8?B?QTFLbjU4ck5JaGZEWGJ3QmR5SnNZV1d0Y0dnOWJiOWt5TllYQ1JZdEwwaHdZ?=
 =?utf-8?B?b2hQbGliNzVtNTFwVHRPN3NNZ3R2ZUlFcTdTVUo2aHhEbnpiMGE3UkVqOFoz?=
 =?utf-8?B?b1pTQWtMalBDbjBBUnZDNFAyUnBQL3ZTcXNSWDJ6b0hGWW44bVArV2YrQmVM?=
 =?utf-8?B?ekJ1dklkNktkejJ2aHJSUi9TUFYvUkFrVGFDWnB2ZENPRUNOemNQSUNyV2Z0?=
 =?utf-8?B?Z2dzemgvUE5SN1k5TWwrQkpoRVZDaEdmU0NkWTQvWE4zNnBzL1JYRXhSVzRT?=
 =?utf-8?B?a01hMzArZXBSWDdpYkVxK3pEb0psR0ZqYXpOWlJDSEV1UGovVG95QkRvVlI4?=
 =?utf-8?B?NS8yN2NHU1BpRzNReERRQjRDSk5jQWdkMXZDYXU2OWszTGNya0NHbWh5NmJJ?=
 =?utf-8?B?WXRXZURxQ2JIVVlCTEo4YkRDUlZOcFZFaTdZSENubHlSd3Y4MVZtWkxVMXRw?=
 =?utf-8?B?NG9CZFV6SC9hSDgzem1NQW9vN0JVcjVaM2ZKNGRmL1lvQ3VXa3FuTXVQQXlk?=
 =?utf-8?B?RHU4YTJ0Z2xPd0hRQXRqczhwQk9DQjZTamYrVGVNbkdsSG0rRXRKb3VYOU05?=
 =?utf-8?B?R0NMallENmw2WWIrekY1OHprUXhtcHdVVFBNNUtkWjRycjZSY3d0MVZjeXlN?=
 =?utf-8?B?YlRYdEszRVVlbHp2eXZvVHdNdll2R3JuTWprZGlRMHZROTM3aU9qdDhVQ1dy?=
 =?utf-8?B?a3FYRFZVS21Xbkt2ZWZ3WjVyY0tjWThnYkpTeUo5UTlVbDlwL1NaRGtCcDJr?=
 =?utf-8?B?TTVvNWYyV010T3NTdzhnYWNzMTQ0djRNQnJTVUhOWk9UcXNIbGQ5TWFHbnhQ?=
 =?utf-8?B?aEhUYU5qTFNZWERiNjBhTDBaak5JcXQrVkxjeWVMcDArTURGZEZEOGRrRS91?=
 =?utf-8?B?eERwWDVwY0xtL0dzUjFiSnlpdWswZVRSZjZEeUR2QnRpSjJpRlg2TGdnV1NN?=
 =?utf-8?B?Vk9Ra25zM2U3aW0wbkNXVlR4RExyaVp0bFAzSmZIb1ZZVkF6bVZVMHQzTU8y?=
 =?utf-8?B?MklqcU5YZnRzZVI3T0hmT2lET0dSUkhQSjhVNHR6MEdjYVV0djRXeUhoc2FU?=
 =?utf-8?B?VlZBaTlZZ3hCUkswdXdUNkxPRk1CdXc0ZDR0UllmT2RmV3JaYUE1QUpJUldJ?=
 =?utf-8?B?a0U0aGNSMmF2dUtTdk82MTh0VWZ5d2JHWWU5c3BQUHpxV2hodCsrbk9sQ05i?=
 =?utf-8?B?K1JXbUxBUVpKK21iKzNTZWpmMXVyU1NTYitGTzRRSHZMRU1mZUtKbmNQdXNj?=
 =?utf-8?B?NGhmdDJtQUhxWlR0YU1icGlic0k0T0t0TTFFeTNlb2lydS81bTFUYTgxdUp0?=
 =?utf-8?B?Q1UrSFVtNmlHS0JKREFSY01aMFgrRE8vQVRUTmJiMk9rVVFkZEhmM0F4TjBV?=
 =?utf-8?B?WkQ0aCs2ZXN1S0NYdmdQRzc2aGRkZ1o1TXJMWVIrMTl3ZXIrV21hT2hoZzFQ?=
 =?utf-8?B?V2g0LzhXUUZEU1Fxa1RDWWorOG0vQzBEUG1QSTlDK2k3OURYOUM5SC9teG5K?=
 =?utf-8?B?bFBYdjVuaVVheGhTTk9OMmRiTDhaRWRFdVBYQTBleXhRYW1HYUVIOVl1L3Yv?=
 =?utf-8?B?VUdEWTNvWWp1ZDhVQnpZcFZLQTJjdU9lemx3TlVnbWZDVGVYeG9UVjV4R2ti?=
 =?utf-8?Q?QPbG6Z6muftMn8ThIR/t7kU=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: aaa30f52-5af9-472d-23c5-08dcede8967d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 13:43:59.3546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ms64HE/OTQh+Hq17527UZfc33b296tf32TG9/MESeTi0FJJJAufakKnAD8WntvnGpS5Y6uUJY4Tq0kgJDCWjUx3ccdDhSrQI+htLM/nHMYM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10673
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 16 Oct 2024 13:44:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5511

Hi Niko,

On 10/16/24 1:54 PM, Niko Mauno wrote:
> The VOLATILE_TMP_DIR variable was removed and it's functionality
> replaced with a FILESYSTEM_PERMS_TABLES entry in
> https://git.yoctoproject.org/poky/commit/?id=2f46b6f27dfa3a9d5ad177900fcecfe64c3536f1
> ("bitbake.conf: drop VOLATILE_TMP_DIR, use FILESYSTEM_PERMS_TABLES instead")
> 
> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> ---
>   .../migration-guides/migration-5.1.rst        |  6 ++++
>   .../migration-guides/release-notes-4.2.rst    |  2 +-
>   documentation/ref-manual/variables.rst        | 28 ++++++-------------
>   3 files changed, 16 insertions(+), 20 deletions(-)
> 
> diff --git a/documentation/migration-guides/migration-5.1.rst b/documentation/migration-guides/migration-5.1.rst
> index f58de3156d..b2e2ccb5c6 100644
> --- a/documentation/migration-guides/migration-5.1.rst
> +++ b/documentation/migration-guides/migration-5.1.rst
> @@ -123,6 +123,12 @@ The following variables have been removed:
>      enabled. Users can disable the volatile log by removing the value
>      ``files/fs-perms-volatile-log.txt`` from ``FILESYSTEM_PERMS_TABLES``.
>   
> +-  ``VOLATILE_TMP_DIR``: :term:`FILESYSTEM_PERMS_TABLES` is now used instead.
> +   By default, ``FILESYSTEM_PERMS_TABLES`` now contains the value
> +   ``files/fs-perms-volatile-tmp.txt``, which means that volatile tmp is
> +   enabled. Users can disable the volatile tmp by removing the value
> +   ``files/fs-perms-volatile-tmp.txt`` from ``FILESYSTEM_PERMS_TABLES``.
> +

Same remark wrt :term: use as for patch 1/2.

>   .. _migration-5.1-removed-recipes:
>   
>   Removed recipes
> diff --git a/documentation/migration-guides/release-notes-4.2.rst b/documentation/migration-guides/release-notes-4.2.rst
> index 30049b89f6..ac3bb9cebe 100644
> --- a/documentation/migration-guides/release-notes-4.2.rst
> +++ b/documentation/migration-guides/release-notes-4.2.rst
> @@ -38,7 +38,7 @@ New Features / Enhancements in 4.2
>   
>   -  New variables:
>   
> -   -  :term:`VOLATILE_TMP_DIR` allows to specify
> +   -  VOLATILE_TMP_DIR allows to specify

Please use double tick quotes to put emphasis on this not being an 
English word but "code".

With that:
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

