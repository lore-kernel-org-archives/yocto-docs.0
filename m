Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81A55C282D2
	for <webhook@archiver.kernel.org>; Mon,  3 Mar 2025 16:15:36 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.89])
 by mx.groups.io with SMTP id smtpd.web11.57464.1741018526120022315
 for <docs@lists.yoctoproject.org>;
 Mon, 03 Mar 2025 08:15:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=BFM/zKQI;
 spf=pass (domain: cherry.de, ip: 40.107.105.89, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QvQxuegj8+vtyBwW1ipcsaqyDR9a3vPxUVma5lQTkKEhnEZMEQUr/q7guvWY+lHZZt2vKuc8cdjw1TROpJNYkpPpsK6llaTLbvB/i2gqsIGfAnweOwtOOoXjx6lx+JBAPX0PY2nFBzxHUIb/ZGkRFvXWujz8OcXjMbj1VEupAcYNcbHQ57ixyivBTOwuQwT6J7GSIAt5kJFYl6Qy8szKM6L1z57hAPJL/OQ+Ha3a0l+ZRLnRBJYWcjSPHSExZlHbtRqA2XANNqcRLK9XH2cEwg3iBHRSrajaK9w4XQz4VXAIYMfR+wUKxs76E0WKJ+IQSt1wi0QVvM1tQQ77VIXwdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TW/tPOE99WPv9njnYmtqu13frtOufFgqdoYUkMCvWAY=;
 b=sU5m+2ngP6T1/EXgmY/nD5cwjE8JFDW1QBcstkk8QKbe3vdCNTRjJYWU6L5wc2E9AtD0sXebTpZy0HhO341/BVL1rNIfWFV2mesUMd6OrbfdU979JPZb+AYfz+hM6w/U8hT4moC5Gz8FYJlZYDI11caTtQ/9a0fJpE6BP7RkT1mF7/ygR52gBcpspSygiaNoZRg9u7M5pjxazS5VoqO9kMyh8wQ9jX2ztTAwCkBisjAh+DJa3yMpKakgh3DzUEDMGuB0f4DXGGUhB6sLwTGgvHugrHA3x54GTUVY0h3rl1ugejHCVbb9c/XwR9DjDn7zyGd4fdQzu5Ln1kYVcdmVCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TW/tPOE99WPv9njnYmtqu13frtOufFgqdoYUkMCvWAY=;
 b=BFM/zKQI5S8e8Y+Rm937MTPxlrClgdnNu9y5PWMEfLNikwYo/L4lI0qQpc7p4zP1obXfT1FxQcThus9vVLz1uVG5sCUyRmW6osdVhd2VlxuvM8UCG7BmFtfm8ytEOkeUs7HWs/Vqy3hMZtR5trOdj8JenaQU7bRe53gTGmJbka0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA4PR04MB7712.eurprd04.prod.outlook.com (2603:10a6:102:ec::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Mon, 3 Mar
 2025 16:15:21 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 16:15:21 +0000
Message-ID: <a270e4ed-d2cf-4353-8f09-e5bb306470af@cherry.de>
Date: Mon, 3 Mar 2025 17:15:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 2/2] ref-manual: don't refer to poky-lsb
To: ross.burton@arm.com, docs@lists.yoctoproject.org
References: <20250303144502.308036-1-ross.burton@arm.com>
 <20250303144502.308036-2-ross.burton@arm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250303144502.308036-2-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0275.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::17) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA4PR04MB7712:EE_
X-MS-Office365-Filtering-Correlation-Id: f37c7e1e-d5ce-49fb-94d2-08dd5a6e98cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VmlsNkxram9mV05KaU5hc0Jra0I0L29CZ0lyU0QwNUJiSzlVZ0lzTmJPVWdM?=
 =?utf-8?B?Y0FlTWE4RlVWZ0tNcldUVkdabUJyMWw0U1krRjgzLzFCRk5nY3ZaaFlnSmwv?=
 =?utf-8?B?VVEyWC9UOUNYNndkVEcybDV0NDJGSURWTmoxbnU4ZEdQNHBUU0pHcHE2MnFu?=
 =?utf-8?B?RGY3dmhPSlV5dnN0VjFJV0lIM1NhelE1Nzc0bGEzMzVzWnh4OVgrVk44SFJh?=
 =?utf-8?B?T0NBamVieWpST2RnZm84alUvdjdaQ3poSkdFMkVYWk4xZkcxQTFwaVM5UDgw?=
 =?utf-8?B?Sk9RQ0lrZ2I4YnY0UWE4REpSOEc2TnVHSEtzTGtTREU1U0tiK1UxQ2xHWVdj?=
 =?utf-8?B?UGorN0ZGd0xFRmNNODBOazRIMnAxYXNoRnR1eFdlcFJuVVlES1NIcFkwM0VC?=
 =?utf-8?B?bFFOTERtUVdQNGtpaHcrT1lEd2Z0Tm85VGJCdVZIRXdQdytlYUhIRDdReTRO?=
 =?utf-8?B?bmR4UkVBZVB6c09ScXc4RU01NzQyZkJ4RlZNMzVvT3Z4UStIWlJrSHRoZ1Rn?=
 =?utf-8?B?bTc3TjMxMmlQZDJMUExJNHhDV2N3ZElFTFJWSm1SdkoxTmEvcjViQXhIZ2tw?=
 =?utf-8?B?YXJkcmV0cXpkT3lrbW9PbFBhRWg5NGxuSFlVeGIyNExNRWhZMzFRcmRMZk9p?=
 =?utf-8?B?dXBYZHlGUmVmUHdIWGx2eU5LUUtXYm1qeXpuSVJWQ2hHekpvMVlLUGhYd1V2?=
 =?utf-8?B?N1lWaTM2Y0xVVk04eU5rK05SVDhwSjFFM3lrRGRud2IyYWw1UE9LU2RmRnQx?=
 =?utf-8?B?SkpWaGJKUFBGL3hwenYzYkh6Y1VvbjlVeUFSR2VDS3Y3VG5oOVM1cGthSnMz?=
 =?utf-8?B?Z0tudHJSRTdJV01QWVF2WGVYd2dXdzVGZXk0MWIydlBxOTUvaWViODFlaGll?=
 =?utf-8?B?d3VTdHJkb09udWM3ZTFRQmpidCs5c2tXTzV4UFJ6Z3ducjhoNHNtL0NIT2JW?=
 =?utf-8?B?dExpcGt3dVRLbE9rYzNUdldoMEY3dU5JTnVOQldtTFNmMlJicWgyeE96L3JF?=
 =?utf-8?B?ekFKaFlHVTZDMlZ1d0lwYW1Ca090WnBJNFlweXl2WWo1S0N4WmtQY25xRlUz?=
 =?utf-8?B?Zk1YMVZtOFc0K2tmaEowaHJtMFc2QnNJYm5vUXJaYkora3BsaGZWZHFsM3pN?=
 =?utf-8?B?L0VpQVdQT2tyUUMvWndlYllyemNNaFFCVHdBaXJEckRLb01vbDdGSHFncnN0?=
 =?utf-8?B?SDh2UzFBTUY1QU10OHdvMG9BSnJHbWsrWmkvb0EvbnBFdHArM3NuUnhjTENz?=
 =?utf-8?B?SmRVWGdwcFdwWWk2bXNBZS96bDJrY1kwZ2Vpa2o2YXR6U3dkbjJiTnRGUjF4?=
 =?utf-8?B?eFo4eHBKWXVjL2pFeldEZTV3bUNucmJidVVGYnowNGtFUlJqL1p1RjBHWG9K?=
 =?utf-8?B?c2tHZUxnMVBnMUJBb0haL1h6NFpDdkc1MHRwNGRBZ0hKcFIrTVpVRVc5NGh4?=
 =?utf-8?B?OTd4aHFKeGFMS0NoR3BhWVBMOElaRTlnVStKV0tZYlNzUjB6SzcwRWNuK1h2?=
 =?utf-8?B?aEpha0Rna1R3LzBpSmJlTVlBaFRaRXBEMzgxdEcxRHo0UlY5RzAzSjRGY09P?=
 =?utf-8?B?dmxiWXlvNWpLUlV5Qi93a0lUL1NCb1Y5eklscnFwb0pZbmNDZkZiWDFZZzhZ?=
 =?utf-8?B?R3o3WE54VjNPKzdVcFpiSXFTOFp1eHI4SEVNYnpwQ1dwVVBwWEo2L3BPM3Zt?=
 =?utf-8?B?UXAxS0o1N0ticmN1KzZqQjNFc3FPNmNqL29rTU5kZzJHUDJhQmkwWXhPTmJ4?=
 =?utf-8?B?VytiVzZPcjVhMWQ4N01ncDM2UlFXY2RWaU0wVUNCYURScG1pc2Rabm9kNWxP?=
 =?utf-8?B?SmxLTE12bUYzNG41QWMydTVTWFZrV1JIb2t4dGs3VnQ4YXJyT0NaWElmUVN5?=
 =?utf-8?Q?6jkm7MAL2/Sjw?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UFE4RDBERW1qTlM2Rmg0S0EyT0NNelI0cmpPU3FEc08zMGd4R2hxU1J2bTJR?=
 =?utf-8?B?WWdOSWtzRi9GYXprMW5BdEJHdjJFOUlBMjcwWU1SMGRBWE5vTUk0K1duRDFv?=
 =?utf-8?B?bUN4dEVMRGdQK3Bmek9rQUIreTNqa09JTHRoTFgzNzlMTkN3RnQvTmdhT2lx?=
 =?utf-8?B?TDRaTVZBKzFHVnRja0tYakZxQUZEUTlybUlzVGc4UGFXQ3g5d2FOLzg0Z3F5?=
 =?utf-8?B?TjNIdmFiek9tbUpoNjg0c0FwU2FuTDZka1U0TGlONys3c0poOTZ4M2hPNm1O?=
 =?utf-8?B?amFFcmdxRGd6R1drM3hNTHNyN21pQVYrdWdtc01pWGJwNGZTcytJRk9RdURx?=
 =?utf-8?B?RFhDTTkxUTRhREUrR1B2cDl4S0VyQlhCKzhscDI4RjZQdFZvNW1LTkYzNTJj?=
 =?utf-8?B?bXVpYlZhSlpMRUhpbXJZWnIwZW9oOHlwd1E0Ry9lNWN6SEdpVlVIV2s4VnBF?=
 =?utf-8?B?OThGamFHK0YwNlAxMDJCRk5odmRjOXhmR2NZbVF2WXhEb001djlQUGxZYjJN?=
 =?utf-8?B?bDVXUG94d1E3aHFWa0hVZXZwdDVXYk5tTStoVFBETlRUeHpRZk9PRlJnbTJP?=
 =?utf-8?B?VEREQUFHTGFqTTVmN1oyM2drRVdyQlpxbXQvL29hRzNvT1VTYlVLdjFhWitO?=
 =?utf-8?B?Mno0SUpyMUU2YlBRL2pqU3JLb1NMV1NMTTB2R0lycCtuUGw3QXZHUFBWa09j?=
 =?utf-8?B?UXlrRnJsdVlBSWRpSy9hTlRoQXZaNm4xYjZTQkdkbDBwZzBoakhwOGEycUpi?=
 =?utf-8?B?MnNBMVVUbmt1NURkUlQ0SGtFd1JJOXlhMHVIRFV6R3I5Q3kya2JpMkE1ZjVX?=
 =?utf-8?B?eERVNlJiZEZ2dFJma3RDVHUwUmlNODIzbWFLbWtGOVZPeUxadThvWlRRWXl4?=
 =?utf-8?B?UDJwbmxwWWN4UUcxdjZBRUxmbytwNWRmR0NHVzkrMWM3eSt3T0V4RktpOStR?=
 =?utf-8?B?ZnNiWVNNT1l0WkN6VktFN1RtMzZSVFVaaWRlZEs3WmFpb2xhTTFmSnlVMVRt?=
 =?utf-8?B?WlM1ZkVyY1BxU010V3FGTHp1Um9BamhkRWhVSDRneFpSdVBhT3MwRytpcFJ1?=
 =?utf-8?B?TDVvci9XdjVoclQrZkJ5ZTZuS0gzWTJ4ZmkvUDdVWVBjTHUrSnZEZTVpcGw3?=
 =?utf-8?B?eFdoL242dFFwT2VMaEgxME5ZTVF0emUyOWVybGxSN1J5d2plbDhDOHlmcENu?=
 =?utf-8?B?QUM2Zld5MDBTdDkyMFFUTVFSMm81bjIvbEtYU1RVamxNUXpya1g1Zi9mRzly?=
 =?utf-8?B?UENXY0xEcE90NlhSTDhaYjc2YkV1TWVsY3F5QWVENG9nVXh6cnkzUFRmK2xB?=
 =?utf-8?B?TUlQTXh2Z09BcVhkRWVhZkFpS2F2YytXQisvWXg0N29nN0QxMkx2T0NiTkh3?=
 =?utf-8?B?QVBWc0s3eTM1WVQ5cUxzWUd2L0d6ZG9TNGQ1SFRWRkpjaUFDcHFJZmY0U212?=
 =?utf-8?B?TDNMNVkrckFWamZyeTFHdmdNZEMxNVBLekNGcUJWVStRSVdrZWRmVm9ETlkx?=
 =?utf-8?B?Z3NKTHNYcWRWZU1EcXA5d0FERzFXcm9HU0xVTlIySEVtWWpFUWVweHVmYlZH?=
 =?utf-8?B?VFJDSnl1Rm9yMlQwd3ZhNU5TYzhURjZIaitYdG5HeGFVNkpBR0FlTkk4RWpo?=
 =?utf-8?B?bnUzMnNIbUVtWTdQL2d4d0p0UnBJRmhMejgwNWJsd25DcFg3b3U3VHNpR3dH?=
 =?utf-8?B?ZVQ3bHQwWWFWam1oVllmUlJ4b2dhd3BRU3NuV1lyWnlZa2EzYWJOdnlXUEVu?=
 =?utf-8?B?UmhRMzVhSU5Qdlh2SThPQnpBYmRGanJiaThVYjJDbkRBdURHRVhLQ0xMTm1B?=
 =?utf-8?B?aC9WVUJaWmorcmkyK2IyMW9DZWFCWTFQRUlIVThwbmhDN2lSUDNIcDNHSktk?=
 =?utf-8?B?OWdPQy85TjFNSzdneitKanN1TXh6YVNKWWZPcVhvSFordVRqaXFybkpqMDVR?=
 =?utf-8?B?SlFTZDVnRnllVWxLNWc3Q3E1dlpkeXR1aTBHcUpNQWY3UWVPWlY1NnhIb2Nz?=
 =?utf-8?B?d1l6TUdVeUZVaXYvcjUyTXlBbTRGRlp3ZEt1bzJ5OUFEZXpVL25ScE9uWklj?=
 =?utf-8?B?eURxVkdQT2d4UjZqY2k0cFNMb3dyT25BL3lwOWpKNm1SM3BCVEpFMlVJcEtD?=
 =?utf-8?B?RFl6dUpPQ1Z0YUI1dkZya2YvaWpLSVBvWU9FMWRNbkdrNThvN1JpM3B5aWox?=
 =?utf-8?B?a0E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f37c7e1e-d5ce-49fb-94d2-08dd5a6e98cb
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 16:15:21.4481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7wOkLqBlkXV3pKAEriRK/0TSve9NWVS97184wcb5dKwPEOkPB8cx1ytzSZMSrAcbCw6ByNwFGsMfRtnIxFaUJPJOanzVBVkUD91RwV597Uo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7712
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 03 Mar 2025 16:15:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6488

Hi Ross,

On 3/3/25 3:45 PM, Ross Burton via lists.yoctoproject.org wrote:
> This was removed in 2019, so swap it for poky-altcfg.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

