Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8069AE7716A
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 10:14:37 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.66])
 by mx.groups.io with SMTP id smtpd.web11.78604.1734430473805830888
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Dec 2024 02:14:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=H8KhrfzH;
 spf=pass (domain: cherry.de, ip: 40.107.20.66, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wogA4bZqHql2b3Y4qQCZxtNEsSCxoEiyCq6P8/L8kP0Pm8MvO1E/JOrmnOY+s3LQmXJ1g54dD9p2ntpnvPNKYeFKMgys98bCkTSg+TNhsaOvVpsvwLgRXEfIJ8o3A21Y+8nuVtPunyn6qXkniWoq40RoNdyRNinLTFP/59DjmS8DplLo3GmmCeNF4ZQNvZkjqEzP6s9RrzmaZqtGhS6MFP8X0PIIAGvQi1TSSKL4rtbnk8xLHpN423Xlpu0YCyzCJuyRxQfWfljJQ8DPmOgQCVywhSmeBUM6oHMZkhwPSfwpZ18mWbChtXg8/rYtNHg+qHbrPHRHgovSGj0Z3Oj2nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nxYlb6Nz3B/ssXEN2XO9YToicFBIsnx0xlMMrS0NKdI=;
 b=tYxszVjtsRLD5WnTosO7OoP3zfg2uVEghTlgS7+6SsO8lKlbv7D7yHqNyGHQOIqK90X9ld4fhrWxjp+aHUwCSP86wbRlDDXR92bflcuUwuKeK/b+HSm2Ffumqd68ir8zwkG4BYzwB2kuZf7W2vQJWDY68A/XsXp5pJE8uQqvJilLPmQwJ7A3B9S3G09kaksf+rMfwzdX23pbSRjtb7xXzBqxw2jI/2o5MGJwzABWNMzw8Ra76RLXEQuh86krBUotrx7JIGXks/Ns+A/ufp5YDpj4vPybKxGrcDzjylJgsq+CvXC02ZPmHXiVincJaCgB1Jmgn0WjRkrIj0AYOAhX2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nxYlb6Nz3B/ssXEN2XO9YToicFBIsnx0xlMMrS0NKdI=;
 b=H8KhrfzHd8w/ezvjLFnDSZsfk57HUwYnRk/OP9TE/oTgKkvp0u8a2yZIpNFdK9FSrrGs9/w6ldu6naGd/YztjSRHXpskb66ew+BO1xmMXSPk1/EhtdJThjkFftPc/b2G1Ano2iu31Htb5HYLP/U1GUPgjOmB27GUI8VavrLkKRg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PAXPR04MB8846.eurprd04.prod.outlook.com (2603:10a6:102:20d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Tue, 17 Dec
 2024 10:14:30 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8272.005; Tue, 17 Dec 2024
 10:14:30 +0000
Message-ID: <a00307dc-914a-40b5-ad47-2ff11389c5b2@cherry.de>
Date: Tue, 17 Dec 2024 11:14:29 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [yocto-docs PATCH 02/14] ref-manual/classes: drop the
 migrate_localcount class
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241217-release-note-5-2-updates-v1-0-b189493b1b09@bootlin.com>
 <20241217-release-note-5-2-updates-v1-2-b189493b1b09@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241217-release-note-5-2-updates-v1-2-b189493b1b09@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0071.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::6) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PAXPR04MB8846:EE_
X-MS-Office365-Filtering-Correlation-Id: 871c850f-e476-4e65-3d9c-08dd1e83983f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TEMvNnNXZ1pDMTJWN0M3Mks5MXlCd2owZGJjRDlybzZ2UnNTalhkbUdpeUk1?=
 =?utf-8?B?ZkNBdkh2OXphOHViSU9SM09VdXJQK2pKNGFUTkliQzRsSWpSN29ISzhXYnhW?=
 =?utf-8?B?VlZFRFZUekFnMDBuSi9DY0xLbWpYUUc2cXRmeVM1dXFOZVp5SW1sUm1OREtH?=
 =?utf-8?B?Y3JZeWJTZnFjYi91Z1FSVElLbXg5RkZmblZwVmYwZE5JNHVjeXNJZXR6MXV2?=
 =?utf-8?B?ZkNzQnZwTEhTZEx2RnhhWEtlaVFlTXNjV3djdkY0cnFmUU9FVThDOHdKQ3hp?=
 =?utf-8?B?RWErWC9wL1pnamNScHRLc1FMVzNmQWM4YUJoa0lnSXFkZC9POXdzS0k5b0gx?=
 =?utf-8?B?SjFoeXJQS2ZBb2RFWUZ4bm1scE9yL2YxZjBCQTc1TTVIMTlCa0NvaVNKanJO?=
 =?utf-8?B?TWVOeFJXSU1xd0I4Y1J2M2xGTUFnZW16WlcxUXFzK1BRdWt4N0RkQUl3a3hi?=
 =?utf-8?B?c2RFbTNadVh4TVdXZnVXM0cvWmpKWHUzVGxvY1VKeXoyZFNCVVBKSTA4RTdm?=
 =?utf-8?B?cTZnUWV0RzJ2RGVKVHM2Q0VoLzdFYlBKVUJ2aUxWYm5aUEJDSldwMHBhWW45?=
 =?utf-8?B?bVgxMXBRUmYrMmtxU0VMdGhDK2p2SHZrZ1EybGFKY2FUNFFIQWtBcitCZHBD?=
 =?utf-8?B?OXlxdXYvQU1QUVpCdkJaQkRmOERSYWtadUh5dXFidkQzdExwdmI4SG10WGtq?=
 =?utf-8?B?NDRsNFY2YUxjTnU0TFJraTdaQk04am53NVBFcFBpQlV3LzhORkZuSUlvK2FT?=
 =?utf-8?B?M1NyQml5bHUvV0dtN0laamUxOTRBQ2VNWkEzanFONkJlNUIxaSt0bS96S1dZ?=
 =?utf-8?B?VUV6NjlDWDZEa1prNVdZbUs1K2lkbE9KODhmaGlxaTYzNkE0TWVqT3pFR0xa?=
 =?utf-8?B?bnhMWUFNUHdRYjBpZUhQdGdvcjIzejJMeGZyS3NKMVVwQ1dLQVlnbFREbmNT?=
 =?utf-8?B?WURPVytwYjJMdG4ycWVKcGovUC9DNS96enBLeDRMSjJmcFhVTFZGT2dYejJq?=
 =?utf-8?B?V1o5aURTcUpibnN6K0ZKTEJHS2I1aklzbGYrSDZKaUUrbUhwM0xBK3d2Nlk4?=
 =?utf-8?B?aXRSN3N2SjlSbkw3R2R5YTRCd1p4ZnRxQ2FGVWt5UWU5c01jMTJiZmVVOEM5?=
 =?utf-8?B?MlNFRDdBaU9jVVdmenhqa3BBL0xaSGFIa2FBSHRUckhTUUhHb3ZVUUtkQTA3?=
 =?utf-8?B?NFcrU0JOcmNsQ042dGN3N1UyL0UxaEdhQ3JMcDdqYkFBSng1WHJXdkRMb3V3?=
 =?utf-8?B?aUZJeUNPYTRjY1paQmxTT3A5S2dwMVJjbzY2OGk2QmF0YWJ1NFdrOElJT2F3?=
 =?utf-8?B?em9GdWZEQ1JhaDFXWlFZOHZ0UVZKRzVheXBrVjgwak4yT09oTjBKckYxZFRr?=
 =?utf-8?B?WnBhQytta1ZMaUtsWFplaDZPc1FPeWlab2tlNm41aXlNalNTdkk0V1E3TzZF?=
 =?utf-8?B?dkZzYTcvcTZteUtoRHVCK3NyUnNmR3pOTWlIdUNYNStNdEdWWnZTWHVUVTZp?=
 =?utf-8?B?T2ZzL1BKYjA5V0VYL08zNVQzTDdvdGQ2Wld6K1B2ZThwSnBZY2tCL2d6VlRx?=
 =?utf-8?B?Tm9pUjBkUVRrL3dMMXhLOWpUWlA0dUVnU2t4c1NQTDNPTWVDU0pJaVMrTVBG?=
 =?utf-8?B?MlBteVVidjM3RkRnRTlRclNqUWNScmhWTFRPcVZ1b0FaRUJMbHlrVmNBd3lM?=
 =?utf-8?B?NTlwT2wwYytsaUJFVEtwWDB0dWxwYUQ1ZkQyTEZtWFcyYVRwYlFkZTVFRjJR?=
 =?utf-8?B?VVZFKzFrYmRUeGluSzd4MGNpdEVjMFJQQ2N1Rmhzamt0S29MQVVPaS9WeEVz?=
 =?utf-8?B?MUw2L3NGczVrWkUxakVodG1NYjU5TVdqSXJobUdKTGhiTUZRS2EvTCtjdzNo?=
 =?utf-8?Q?1S1iSYzhghLhs?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?T0JzSjlVdXFuREw0eUN2bzRMTElKUFdhV1BLc29UcDMxZUlXWkczVElQbWIx?=
 =?utf-8?B?NnlxYnFBZFRQcHlEOFJCWWZWbFpzbWhSV1hhZFpZK1hWSjVlQzZHdVFpbE94?=
 =?utf-8?B?dWt5TFhFWFVSdmRmMGNwZWkwcE1IN3JKQ1J3TngzbytHczUyU1BVQWdSUkdN?=
 =?utf-8?B?a0dlekR5cHpOWmREczhNS3RmSEFjWlA4VmVBdmVKVW51K3RnNGFnN3piaE91?=
 =?utf-8?B?QXNHdXZiK3ZhME5oZG04RXBZRzN4QUZOdm5IdWpTY3lkYUsvSTRXTVQySDM5?=
 =?utf-8?B?TkJacmNsNEtxSGJkSWg2UFk4RjRKMnI0WW5YNGliRGN5OGYvZzQ5NHlKc0Z6?=
 =?utf-8?B?ZHZmcndlTWljUTFKdHRxeE9xN0Q1TmczRmUyTzJrR1VMenB3dFh2UXlvNW1w?=
 =?utf-8?B?UFpsNzBmbUNPTFd3RSs4UTNUK0Y1ZXYyNmNldFdleURZNWVzZkxXQjEvUThD?=
 =?utf-8?B?S3pCZ0tsYjlHaTFCR2lLNU1CQjRGZmF3TEJKajREY2ZPZGtIY00yVmlLNS8v?=
 =?utf-8?B?MXlHV0VPOC9wNnhISjYxMWxod0tGN24zUG1lREFDTTRUVU41MklPUWVvMjc0?=
 =?utf-8?B?TkRmVnZLWVRLY1VKUFd3NWVGN3FEWVVLQ1VUSGZzKzc2dEpNR3I5WTVDbGVi?=
 =?utf-8?B?Qmx6MlhycjlKb0lkU0t5dmpsVlJSUitsU0RHVGdXd0xOV3JGUVBLSnA4YWlk?=
 =?utf-8?B?RWkyZUh1cnpBUThWeDIxODZLWHNib29FYVNvYVRwU0JNYjIzSHlnM1VBTTNv?=
 =?utf-8?B?dlpoNGNmRHZKbi83SkxiZEtNV2dINnZjQXdDTnBjaUFtYVcwcXNsZ0Mzb0U4?=
 =?utf-8?B?VzhkWjBFeGR5N09aTHVKOWlid1dvVlFzS0lmTnIrVCt2ZlBUQ2ZKRWUzeW13?=
 =?utf-8?B?eXRCU0h6RWJsemYvZHdJKzByUk11dGY2b3JFQnFxRkdiSkRHcjdxeDVKc011?=
 =?utf-8?B?NVNnUTVlZGNlZHlqK3o3Sk5oZUtxdGkzWDdjeEVTMExVME1ET3QwKzdLN3VU?=
 =?utf-8?B?dlAwMk5GRC9tYm41ZjJIYlZoMTg2aUdnOCt4amhWcVUveGRWL0pKaFVxOUxF?=
 =?utf-8?B?d1BWanFHa3E3enJJeENDbkNLcnZPZEVxMlI0OU9KejZ5Y2RuMjlrLzlVSndQ?=
 =?utf-8?B?QisyZml6NGF6MTU0MTFubXJOaFJoSUgxZThvQU9peWJCczFKRElmbHcyaGg5?=
 =?utf-8?B?TWk0SVVVUzRYdTBuMEJCWkY0TnZEMEZWVVdvSnlseGJNbTJ3dCs0R1BEa2RU?=
 =?utf-8?B?WU41Wkx4WUhEbFRDN0Z5SGhEc0h3R2UvWHBJYWtkUlhuZjZrOHZFcVlLQVlp?=
 =?utf-8?B?TGthVnJhdWI0K1B0SEIybkJxOHRZSDlFTW1YRmNZN1FHa1lVcStXbjNpTC9o?=
 =?utf-8?B?eFpOeU1iMTdHVGZqWStmNDJxOUpKYlZ6UjRFM3VOWUdQZGdPWXJUMnZWczZC?=
 =?utf-8?B?OG5nYmNvRE1SdDM2cHA2VVdLWXNTT1dQMm10Y25iY1AvSHgzMUdOdEZzcith?=
 =?utf-8?B?YXY1WE5odFpUM3hqL1VJcGxEdGVKVC9JdGVxM1VlOHphSTJRYm1FcEJDN3Az?=
 =?utf-8?B?c1JjNVFJYlNzTldlLzllWTRwQmtVZU5HakYyZC9iTDhXMjExVHFTT1NjWXZh?=
 =?utf-8?B?SFV6V0lCUlVTNU5oYWNwRGZoNHRiditMSzFuNzBFWCtMeC9pWnhRYzZUTFRF?=
 =?utf-8?B?WDRnVTZDVnhJK2ZjelMzMlh4dWlTTUNsa1ZzTWpwdTk4WE9rTFlxNHUzcEFF?=
 =?utf-8?B?dytUZHdJUXRSbVZRUHlBVnNxaWVMdklRT0VkaENLRlU0cjZPSU5UaTJGcitS?=
 =?utf-8?B?N0lJNUo2NElOZENGSkVsQmFzSzJPaEVncldOQkdOTVpXRFJYREsvTzhJZkZw?=
 =?utf-8?B?S0I4cThUMHRDSG1TMVpHTGdIekJXcmp5eG9LalJtK3Mrb3NFNDBwdjQ3M0Y2?=
 =?utf-8?B?NFFjanc3UDdDenRrTEFSeVpqRGJEbWhUcTJ1eHBKUVl3QXpQVVBneXVjUkFx?=
 =?utf-8?B?UVVkd1hnMzRjN3UxVzdyN2VFdVdPTUt0Z29zanpoV1VId05uTjZGczhsY0Uv?=
 =?utf-8?B?Uk41Vk44d1l4RUhsbzdRM2JNaGVTdE9EYTRqbm1wQnJSMHVlRXdJNm4wK3Br?=
 =?utf-8?B?YjRCUkZIeXpoUE10U1AvbzFJemtRVU9peDZLS21GVzJxcndxcnhmSGZrejM0?=
 =?utf-8?B?eGc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 871c850f-e476-4e65-3d9c-08dd1e83983f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 10:14:30.1589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ORJh/yDnFsS0bfJZ5eq2kxl3veLCVZA7TS/EHrIxl72NmHF1bkzYLzTKm9qo+z3A0pprahDWQ6Ux9MOrVQ1mnH3WTZ9L19o9sp4Ko9w9MKw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8846
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Dec 2024 10:14:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5951

Hi Antonin,

On 12/17/24 10:27 AM, Antonin Godard via lists.yoctoproject.org wrote:
> This class is obsolete and was removed from openembedded-core.
> 

Since when? This would help to know if we should backport it or not. (I 
know you're the maintainer :) ).

OE-Core fca25fc4d7721f85f64c942307ebe7ba9f2fad3e so only in master.

Its removal should probably also be mentioned in the migration manual of 
the next release?

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

