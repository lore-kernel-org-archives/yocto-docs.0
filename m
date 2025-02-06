Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2F05C02194
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 09:25:33 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.13])
 by mx.groups.io with SMTP id smtpd.web10.36491.1738833918542432064
 for <docs@lists.yoctoproject.org>;
 Thu, 06 Feb 2025 01:25:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=F8kwRWkp;
 spf=pass (domain: cherry.de, ip: 52.101.66.13, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jxExBrp2PvhJXq5gkQylniNqkQNiQinwRPnWn06BbbEc47gcgnvkoTLX8r+KWBQp3bukm37l/MXj9nL1IvwN242PvM0KVnq28jMIfJctBQc5YkoR29RKHDxqMNFMDdH1cu4UGE3aqrIaeJHLFsn+nLnGUcaLuO++oPUgoGT4eEOiM/Gs0kvOKaqy50nU0Zc1KGajRbEd87vPeb2cs009PLGpmr36OQrmKaa919yzTVm19hfOqEpfDFfoVtIE7F1WlZtn4KIW4t6VhIakcbmXCM5MuNhTaJ0ko3xNvTH5mjlK0fyOlG7xGvBZA4kJZHRMiUI4kO4d/z0TEfw6uus+vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dIE204gqTOrBfgwilfx1P5VX+I4GN1wG/+WtcI+WssE=;
 b=cBZ+011+ZKBRZvBF3BNK2mKo5FRlKCZsMghBKm0xGeFFS7ImPzmcoWqewMMc9PZqJOiZPFVBmFZrFdFwl1Ie+x853eLDp4v1rAqmn0xFOQPjD/deajU+i53A/3Auh0TEpQlosOF45p6HK3+65UPFZ7vUq+e0pJeVYutpNyveEP7Ta7+eQ/NE4NOYJSkkhD5q7hKum4feYlcZBrbD4fSkUKo3KgGKTAucUcO4P3zYTSxTcnwMX0hWowEMXmICZyz0YTVqIBVMC544bFV8Q2QOGEw7MO7RZpxw2Zsm5Sm9pw1zvW0gvICF1RVlxrvq+bisP+ky3+ZKd0HahICNKUDG5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dIE204gqTOrBfgwilfx1P5VX+I4GN1wG/+WtcI+WssE=;
 b=F8kwRWkpE4QNKYHzY0tD+Khkb1M+2v1zOYeEwD8kVPrcXLHZLQDxyeISnmOdYbNSH5OMY7zATBBrFDvuye52TI2r9YjHj7u+V1ISRGY/HnT0+jCk6HF0Xl15B2MdvDh1QZz4vbQ4Ae12wiBlzbZa19J4V7Dc7NtNIqv5ccVC14c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PAXPR04MB8718.eurprd04.prod.outlook.com (2603:10a6:102:21d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.13; Thu, 6 Feb
 2025 09:25:15 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8398.021; Thu, 6 Feb 2025
 09:25:15 +0000
Message-ID: <23e98634-61ac-47d9-a237-8ca27b36e575@cherry.de>
Date: Thu, 6 Feb 2025 10:25:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [yocto-docs][PATCH v2 2/2] migration-5.2: add virtual
 provider change
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250131-migration-5-2-updates-v2-0-4ce688a74bfd@bootlin.com>
 <20250131-migration-5-2-updates-v2-2-4ce688a74bfd@bootlin.com>
 <ef83770e-6502-4f74-8ae4-89954666780b@cherry.de>
 <D7GA5NFGNWXK.22TNU3A37YW4I@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <D7GA5NFGNWXK.22TNU3A37YW4I@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0247.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::14) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PAXPR04MB8718:EE_
X-MS-Office365-Filtering-Correlation-Id: 6563f1cf-b7e2-4324-5bc5-08dd469029c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|10070799003|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?amhSbjBkejBEblA4YUVHbHlScHNUSHQ5Y2YzdnVjaXVwRGJ4eGVTOEhUcVhq?=
 =?utf-8?B?MmtISU5nWnBJUk1ZKzkxblhtRFVvakUxTVBsb0orUEExYTJ5dWdzSmRndXNi?=
 =?utf-8?B?RHJvaStaMUdPdUpaaE93UVNxb1FieDhpZ2h6QXJKSjNSYlN4Y1h3czRZdjJm?=
 =?utf-8?B?aThQTjdFVDJpdHUrc0RMTElPSi8wQkVLbGNFdWxVSkk0eVFzREJFT3FFQkg5?=
 =?utf-8?B?c0RCeVpZVVh0LzFvcW9EeUJKREJUS1dJL2t5bmNVRmRkOWFYc3dVVVQwNmk3?=
 =?utf-8?B?WDUzS2luRHN2Vk9IU3piaHBGZ24rZVl4QUo0NDJNT3lzQWhkdXcvWXZMK1lQ?=
 =?utf-8?B?UTRqZ25FZGdRU0RIYVNDanZOR1loTDA0bXc5U25oR1NQeVlzWUYraXcvQjVa?=
 =?utf-8?B?bVpnTFlwOXJZSEhWby9ibXk1NXl4bzkvbVY3WG1CSXNPSkE1aGNKalAyaEE3?=
 =?utf-8?B?SkpaNWhmZWFxYndreWhrRk9vaVVIWERMLzlsUmNCZ2MxaFdwNGpkVkJHN3hj?=
 =?utf-8?B?MHIyK3pwb3pYTzZZRnlEN0FBYTEyQnU1QUdkK2dnZ0hCc25wQlFsOXR5QjUx?=
 =?utf-8?B?bHMrSCtyT0hPZDd4dEM0N3llMWk2dllSTkFKYTlxaVB6Z2RJOTRlSFgwUVpw?=
 =?utf-8?B?OEtsaTVmNWttTzZmVzRZeHFmR05tRUhwNFBGRWM1cWJCM2lZNzdha0t5R3Qy?=
 =?utf-8?B?Q05YVmJReEw1R2hTY1ZZY3pxU0RQNnN5eExQYjlLNEZRU0o5QUUzdTFrUDBB?=
 =?utf-8?B?UFB0MllrRCtOMUtZVnFIYzRKSVNBNzFBVnhQd3FkNS9vVlY3ZGp0R0lJejIy?=
 =?utf-8?B?SzkvTitvdmEyMktheVRFaXQ1U1hBQTlYSkw4MjdlUm04Um1oVUpKMVhXTkxx?=
 =?utf-8?B?a01kUWtvMW5KM0JoVGdOaUxzVGpSMklGbzhVVnIwNDM5Ykh1alFlcVFzSkU4?=
 =?utf-8?B?dDVQdGZha1RWczJPQXhDUGRxOTg0ZWthaGdaU25MTElhMlRSL2I4ZithSXFj?=
 =?utf-8?B?VlJWNGdPdXhlQWNXWTYwbS9zNFFncWY1N1F4R0tCNm5kNUh2enVSc0dVR0gz?=
 =?utf-8?B?eWFrMlJrTHc3ZmNrdmN3VURtWDdHV29MOXgrem10SjkxbVZWanliUWM5dVhF?=
 =?utf-8?B?L3RLQWhRYXlQMGE4NEJBdkVRRlpBNHNXRFJtdWxLeWVXVzRSK3Q2eGVpbW90?=
 =?utf-8?B?ZVdzZWlObDQzVzQxa3htYjdkREExdzhpVHlVL1FOa1RyeE5GZTFucGNMUE5H?=
 =?utf-8?B?TlN1dFhYWXFVTy9aOFZaSkd5VGJoWW0rUlpGWXZZSndaK0VvQjM1SUk5UE9n?=
 =?utf-8?B?NTFmeVhWaWhYakdnVEhGcDZtbU5sRlhxdXI4anRERWJucXRVVGRRdW11QlpW?=
 =?utf-8?B?ei9XaDhvcit4UFlJRW5RWmdSSFBETDBNZXJDN3l4UEIvV3IyY2lxdXBsUllP?=
 =?utf-8?B?eTA1djUxNzY3SzBiY0gxWCtMOUk4RXlFTFhBT2RSSVNTOWtTcGQxbEtqMmR4?=
 =?utf-8?B?VXBEeTNBSnppMVdoK3VoTmpnWUR6ZERLYmRmRWlFM1o5b3RzWE1acVo0Y2Fs?=
 =?utf-8?B?WXVoVUVwTWUycFVaK1lwUnZjNGs0NnJtODdGV29ORjRCZFZGenR0bzFGbTlv?=
 =?utf-8?B?Mzl3SFYwLzlTTmFZRXU1alBlL0xvYTM0VVZ6MGlaN21wMElxUUR5VDV5SXNB?=
 =?utf-8?B?SUVQZjhEb1l4SVJVRmNrN0ZGbXo2ZUx4dEhMcmN0Z3ROUFNyOFNpUHpocTVI?=
 =?utf-8?B?UWZNVFVDd1RidDJKZHdVenZqZG0vajY0MkRmeEFibGRZYURibWRLZlVNcklX?=
 =?utf-8?B?RnRsTDRxNnNqTCs0VnJycUFVcnRYUEoxandmS2p6WUdrU25UU3VkV2l4eFdX?=
 =?utf-8?Q?XnN4HS4r99m/X?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Vm9NT3pjN3czYm84OTNIMUZMejhoczV4MHFSZ25nYSs1d2E3c3lYK2VwN0Vv?=
 =?utf-8?B?VG9aZjhKK21QeFZ3eUdIQXlMQ1RKYkw2VmkrRWdlblc5R1ZNT3dZcm91Z3FP?=
 =?utf-8?B?cG81bS9rczlVbjNCa3N6LzN0Y1paWk9qVlhjL0dLbm5KWEIyVlRmNjE3K1Mw?=
 =?utf-8?B?d2daQjRhNkpjMFFLazNFdE5BZUgwZTFTOE9lR0hvdmNFdWMwdVZ0a0hrL250?=
 =?utf-8?B?aE1kS3JvK0pTU0JrSDgvOWw2UzVKVi9sdk9aeUVWVWVJejlmSmhSVTRTc1Zy?=
 =?utf-8?B?M09jdEhWbGtXWktoUVhPcFl5MU4vemxPNmpmbC9qY3M2UTdsSXRUbEh0YVh6?=
 =?utf-8?B?WUU4MUVrRlVsRWFtd0VVV3JNZzZjL2dkTnBUMWtaWVhac1YvYnhQTFN0M0xD?=
 =?utf-8?B?aUhjYzZrZ2xiRWdRSkdiZ2tENEcrdDdKNmZjR1dnMExlbFFDekV3V1A0Ym50?=
 =?utf-8?B?SDNraGlsU1czbXdsWFMyTzdVcGMxV2V2bC9NRU9QUkJKbnFqUXgyRVBRbk9Y?=
 =?utf-8?B?ZEQ4WnRyVDRXeXgrWkhXUGxqRkNqWWhzMm8vR1hwYm9CWStCRkVVdk0yTGJX?=
 =?utf-8?B?ZS9pWHBpY2NWbmYwRWc5MlFWKzNwUEJjT0R1MXdyd3RGekJjM1VINXE5dGdS?=
 =?utf-8?B?QWJ2WktuQW5yTGFtSGN3a3ovSXBDS1FYWDFwUFRGekFpYUppQTVLTnVMTWpM?=
 =?utf-8?B?aUxldllIWG1ZSGZwOFZQZmQ4MGQwUzJ1cnhxK3o0bnpCSzcrOEVSUkgrMGZK?=
 =?utf-8?B?RVNybmE2aVdpcTJnRDhuWVlXTXN2ZFc0L0dEOEMyMkNXeFNLVU96WjkzRDJE?=
 =?utf-8?B?UVNZc29iN0o1QWpRa1FMSkkvUldjTWtoZ1M5cVAwSU5xVVJLRFZBVDBVaFRn?=
 =?utf-8?B?ejFFdHF2TlcwdnB1L1F5SUw1NFJHenhJbElPcTlVdVNSS2xSVVFZT3NhYmw2?=
 =?utf-8?B?d1MreU9VU0xZckFPSlZLck9FM1d4ZDVwMnd0WWxvbFJoY1dSREpHeXNCZkxz?=
 =?utf-8?B?Tjk4VEkvY2M1ZEJZUU8yditSS29EejhOalFMMjVsVktJdy9iWUVwSkdOTWYy?=
 =?utf-8?B?UDZEMTRReXNWeXZESjNCSEU3NFNYTlZqempGVFM0blhNQWROMFk1Mkx1SlBx?=
 =?utf-8?B?c0ozWlBrbC9pRXFlblltMXZLSHRlL0Nkeno4elJldTFHWDVWdDcyMTdFclJv?=
 =?utf-8?B?bFZDMElwRkREMWI4MG5CSE11U21scTZ5UkxXbG4xNmVSemFZaWl3N1VKKzkz?=
 =?utf-8?B?VjFvakVjakJtUWc3L0xOQXJpbllzYjMxZEJ1dDJ2K2xaL3UyWkR0alRwMUIy?=
 =?utf-8?B?R3BRVWNFQU5VYVRIUDVaMjZHMmJMRk10dUd2d3k3UmlaQ0xVSlhVSXpaeXBR?=
 =?utf-8?B?bGM0ZVE1NlUyRzZDbUVOTE81WitqcjVTN0tpOW1DR1F4ZXZTOHUrUFFQWVls?=
 =?utf-8?B?L0ZYUExPbUVtbGtOeVVJUnBEa1BZSWkrRzNVR2pJbUJvalVadk1jSEQzb1d4?=
 =?utf-8?B?TXpXYXQyOEZZTmZFRGZ2M1VWZW9yanlVcEFva3JZa1RnNEdNMGFmMnVrL2tO?=
 =?utf-8?B?Z25PNTZDVmpnRDJLbG83cjFHTU50aVJpNk4ra1I3NTYxUVpGSm5zc3NFTlVE?=
 =?utf-8?B?MUp1NXByY1VzWHZyR1Z1R3NvWDRVVzRVUGlkU2xkLzdsVzhFbUp4ck9JQ3NB?=
 =?utf-8?B?S1ZxalhDQkdkbW41VGU3aW5kQjZFeWhsN0M1SEJ2SGxDdzZZbmJRZnZ3cnF4?=
 =?utf-8?B?TkdxaWhCd0JRMnFFSVE5enZibk91Tm9Mb2hDSmlXMmFLSUxzaTRaUXU3UXZS?=
 =?utf-8?B?UjV5KzBSNUhjdURaTGgrVzdPTDBhMWtweCtwN0tZSE9MZFBVZFkySVMyakZR?=
 =?utf-8?B?UjFySGZINDg1cUxFeHZpWnpXM3lYeEpJLzdpWGQ1WWlCM3hVZEJQVnAvY0tn?=
 =?utf-8?B?bXZ3OUVFbUJrQkREcWQ5ZmRqMFIvRHE3dXczd2c0OFNkaWxTZVQyOUt5WTBp?=
 =?utf-8?B?ZFFOKzZRVUU1MWNBWjJxR1pwYUtZQTRzY1VTWC9TQlJEYlpBS0RsT2pSU0JJ?=
 =?utf-8?B?M2FNQTd3OXpNOXlMclMyZ1F1aFN3a3J4VWg1U0R4TFRISGJoYW9FZ0JBbDlq?=
 =?utf-8?B?Vy9SSVhBSk92RE9wb2F3aFp1dE5MTmtOcmY5eC9vdWtnejZ5Y3ZRRi9pb21S?=
 =?utf-8?Q?3qNeIGRWqGSKz4a7fGZaXRY=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6563f1cf-b7e2-4324-5bc5-08dd469029c9
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 09:25:14.9836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oFZNAcQyUUojtM0tlSwttYW0ERg4pATlt3OTMVicVA4ZcBvhNO1mH0gGqdJ41mDKuulTKiG9L9ptjzjDQyf+k9ypcuE9RLmBjVTRioZhiUY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8718
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 06 Feb 2025 09:25:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6255

Hi Antonin,

On 1/31/25 2:07 PM, Antonin Godard wrote:
> Hi Quentin,
> 
> On Fri Jan 31, 2025 at 1:18 PM CET, Quentin Schulz wrote:
>> Hi Antonin,
>>
>> On 1/31/25 12:14 PM, Antonin Godard via lists.yoctoproject.org wrote:
>>> The commit 4ccc3bc8266c ("classes/recipes: Switch virtual/XXX-gcc to
>>> virtual/cross-cc (and c++/binutils)") in OE-Core changes the
>>> virtual/XXX-gcc to virtual/cross-cc (and c++/binutils) syntax. Add it to
>>> the migration manual.
>>>
>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>>> ---
>>>    documentation/migration-guides/migration-5.2.rst | 29 ++++++++++++++++++++++++
>>>    1 file changed, 29 insertions(+)
>>>
>>> diff --git a/documentation/migration-guides/migration-5.2.rst b/documentation/migration-guides/migration-5.2.rst
>>> index a60e3e9a8..b29cb2052 100644
>>> --- a/documentation/migration-guides/migration-5.2.rst
>>> +++ b/documentation/migration-guides/migration-5.2.rst
>>> @@ -105,6 +105,35 @@ some obscure bugs.
>>>    Any logic based on ``BB_CURRENT_MC`` equalling to ``default`` by default should
>>>    be changed to be equal to an empty string.
>>>    
>>> +Virtual toolchain provider changes
>>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> +
>>> +Support was added for virtual providers on a per-recipe basis for specific
>>> +key toolchain providers listed in ``BB_VIRTUAL_RECIPE_PROVIDERS``. As part of
>>> +that support, the ``cross`` providers were simplified to remove the triplet
>>> +prefix (:term:`TARGET_PREFIX`, :term:`SDK_PREFIX` and :term:`HOST_PREFIX`) and
>>> +generalise the naming. Here are example of how references to these variables
>>> +should be changed to use the new ``cross`` syntax::
>>> +
>>> +   virtual/${HOST_PREFIX}binutils -> virtual/cross-binutils
>>> +   virtual/${TARGET_PREFIX}binutils -> virtual/cross-binutils
>>> +
>>> +   virtual/${HOST_PREFIX}gcc -> virtual/cross-cc
>>> +   virtual/${TARGET_PREFIX}gcc -> virtual/cross-cc
>>> +   virtual/${SDK_PREFIX}gcc -> virtual/nativesdk-cross-cc
>>> +
>>> +   virtual/${HOST_PREFIX}compilerlibs -> virtual/compilerlibs
>>> +   virtual/${TARGET_PREFIX}compilerlibs -> virtual/compilerlibs
>>> +   virtual/nativesdk-${SDK_PREFIX}compilerlibs -> virtual/nativesdk-compilerlibs
>>> +
>>> +   virtual/${TARGET_PREFIX}g++ -> virtual/cross-c++
>>> +
>>
>> I am not sure this rule applies everywhere looking at the commit that
>> makes the change? (see below for related comment)
>>
>>> +A :term:`PREFERRED_PROVIDER` assignment should be transformed as follows::
>>> +
>>> +   PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils -> PREFERRED_PROVIDER_virtual/cross-binutils
>>> +   PREFERRED_PROVIDER_virtual/${SDK_PREFIX}binutils -> PREFERRED_PROVIDER_virtual/cross-binutils:class-nativesdk
>>> +   PREFERRED_PROVIDER_virtual/${SDK_PREFIX}g++ -> PREFERRED_PROVIDER_virtual/nativesdk-cross-c++
>>> +
>>
>> I believe all PREFERRED_PROVIDER would replace TARGET_PREFIX with cross-
>> (and rename gcc to cc, g++ to c++).
>>
>> SDK_PREFIX would be replace following the same pattern as TARGET_PREFIX
>> except that an override with :class-nativesdk should be provided. Though
>> it seems there's now a second variable for each PREFERRED_PROVIDER which
>> had an SDK_PREFIX, it'll also need nativesdk- prefix added to the same
>> pattern used for TARGET_PREFIX. Except for compilerlibs which only gets
>> the one with the nativesdk- prefix.
>>
>> c.f. from 90e0a0f7f4536e1aeb311ab2b061be71b4129e4e in poky:
>>
>> -PREFERRED_PROVIDER_virtual/${SDK_PREFIX}binutils ?=
>> "binutils-crosssdk-${SDK_SYS}"
>> -PREFERRED_PROVIDER_virtual/${SDK_PREFIX}gcc = "gcc-crosssdk-${SDK_SYS}"
>> -PREFERRED_PROVIDER_virtual/${SDK_PREFIX}g++ = "gcc-crosssdk-${SDK_SYS}"
>> -PREFERRED_PROVIDER_virtual/${SDK_PREFIX}compilerlibs =
>> "nativesdk-gcc-runtime"
>> +PREFERRED_PROVIDER_virtual/cross-binutils:class-nativesdk ?=
>> "binutils-crosssdk-${SDK_SYS}"
>> +PREFERRED_PROVIDER_virtual/cross-cc:class-nativesdk =
>> "gcc-crosssdk-${SDK_SYS}"
>> +PREFERRED_PROVIDER_virtual/cross-c++:class-nativesdk =
>> "gcc-crosssdk-${SDK_SYS}"
>> +
>> +PREFERRED_PROVIDER_virtual/nativesdk-cross-binutils ?=
>> "binutils-crosssdk-${SDK_SYS}"
>> +PREFERRED_PROVIDER_virtual/nativesdk-cross-cc = "gcc-crosssdk-${SDK_SYS}"
>> +PREFERRED_PROVIDER_virtual/nativesdk-cross-c++ = "gcc-crosssdk-${SDK_SYS}"
>> +PREFERRED_PROVIDER_virtual/nativesdk-compilerlibs = "nativesdk-gcc-runtime"
>>
>> Now looking a bit more into the changes made in this commit, there isn't
>> a simple search and replace that can be used, sometimes it's replacing a
>> variable with one value, sometimes with another. Depends on the recipe
>> the change is made in I guess?
> 
> I guess so. It's probably going to be different based on the recipe, but I
> wouldn't know how to phrase it here. I just gave some more examples to
> illustrate the changes. Any idea on a better way to explain this?
> 

The issue is that the example implies that the change is simple and 
automatic, it is not I'm afraid. For the variables that we know can be 
changed automatically then it's fine, I believe that's the case for 
PREFERRED_PROVIDER with TARGET_PREFIX. For the others, maybe stating 
that one replacement could be X -> Y but it depends, so rather see <link 
to commit> to check for yourself.

Don't have a better suggestion than that unfortunately.

Cheers,
Quentin

