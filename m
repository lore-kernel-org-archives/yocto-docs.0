Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 320D2D6ED31
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 13:36:33 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.53])
 by mx.groups.io with SMTP id smtpd.web10.10747.1732196189932877119
 for <docs@lists.yoctoproject.org>;
 Thu, 21 Nov 2024 05:36:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=GELvazgP;
 spf=pass (domain: cherry.de, ip: 40.107.104.53, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PLG9/MRhIGrwPtNChbepS1Un399rMA+dgtlSxjAg3lw6l0ax1ZPvYoF1A6kQXXGwiCJJF3+X+oBw0tEzXVNWQ4lofHV597AVEtBsEVmpAzQxMj3x2RBf3JYPlnWa0KBu1PJqwFZ+H+8i6ZncqAfiDGaeNqh9UJvnmOlwmquhK9HF2CYs6470ke18NTi6GHTnt6tQHddpjniT0mEP61ZUtwJ0bdSckxpC16TkR1QOnWb4arxInPuha/AX/T/zGqYNSt2fFiT37rkuixisQcODteDr2qLKX+oIsv4JXSgm6S6I8NfB99aC4DmrBB0F28+2H/vAbXuMiDsQuwmq2e9PTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NtUwDb0rf4ZtZYTBqxHOnplBIfVzgJGjTC+YC2nJLyQ=;
 b=TfIFj7YKuIkCU8c7hEG5+PhrbHfBPdwE0NZ+sxtRO86rr6h+VmNVNY5au4SZ8xdIRhUOURsCurJnP+X/IELb9VKtw4TC8CHLBNp6iz1kR6IIurQbaitKrCIU6JhVCBLN942/9fbTBp8mNol92F48bcx977TPxLpuYNJyCEXSu5Rlw2FXihYgaZRPGFDSrouIFPA6fGy+Mx6uEKuy3egz9aEamIk/3oseSpHRLS0lfZKhlK86Kohnhv1WWb9lZKdv0mNlTwI5w5D3LdI2SFeS5LM0LhRiEn1cIhxbLTOZY7RkhW9208w3cA027Y9xXbG9ibiudRssSxsF63zJa6uO1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NtUwDb0rf4ZtZYTBqxHOnplBIfVzgJGjTC+YC2nJLyQ=;
 b=GELvazgP66nouJSN2Zjb9oW0iaSFib6mcIz+tHBFfNX2RzlxySUm+zQkDUg/OUOVIFjdTxBqq87q0PZYxOZGX5H2bVAO0E1JuSi8/5Z5ursM4L++oYTdCI3DfL5ivFB9L6KWRRCll7GQ9AMU9H2s/MyJL494BV5FS21pHh8aW00=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA4PR04MB7535.eurprd04.prod.outlook.com (2603:10a6:102:e2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Thu, 21 Nov
 2024 13:36:27 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8158.023; Thu, 21 Nov 2024
 13:36:27 +0000
Message-ID: <eed98213-3985-4f04-82df-82a4fe039eb5@cherry.de>
Date: Thu, 21 Nov 2024 14:36:26 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 3/3] migration-guides: document
 ZSTD_COMPRESSION_LEVEL change
To: alex.kanavin@gmail.com, docs@lists.yoctoproject.org
Cc: Alexander Kanavin <alex@linutronix.de>
References: <20241121133025.1064006-1-alex@linutronix.de>
 <20241121133025.1064006-3-alex@linutronix.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241121133025.1064006-3-alex@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0233.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::15) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA4PR04MB7535:EE_
X-MS-Office365-Filtering-Correlation-Id: a69bba80-fc0b-4173-d545-08dd0a317fba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RTRBbGx4MTMzczllS3JaVzcwdnpocFVUeXBZYmJUaDRucC9NMGhOK01NWXph?=
 =?utf-8?B?S0dRbmg2WStSaXBsZGRON2Z1TlNmcWhGaVlRV2RjNWtaekNlVFFlOGQxQU1Q?=
 =?utf-8?B?NjdvSVRvd3QyNk1OSnk3S1ZFTEdmejc3cks5SVhlcFlRUUNneU1DTkh6TmFt?=
 =?utf-8?B?Rit5WjRqWXNuczdCRVhHOFhMWkY2TnB5aDUzUGxlMWVDSkF0OEZZNEgzUXNB?=
 =?utf-8?B?K3laUjdZdnZ3ZWg1cXo0T2t0cDdSK0h1QlpnTytJS1pHeDZKMHU4a3dHTitm?=
 =?utf-8?B?ZG9ReitkbTlVRk8vUXJyRHZ5MHYza2xoNTBFZ0NuZ1lvMlBIbmZJUkhnS21K?=
 =?utf-8?B?dnh5RG9qVkNianpCZjhwQUVGUWRHUFIyMjZMaytBSTcxYjhaN01vcStyZW0r?=
 =?utf-8?B?Ukc2YVVxcnFmbnRQZTJ2dXZtM0JlWFN2MGhiQ0p4a1dyY3hiTTBvQXJJRmJD?=
 =?utf-8?B?T2E0amtGZU9la3BEcnQxZjdweGc2cHkyQ3lWQ2pWSThHTk5qNkYybDIxM1J4?=
 =?utf-8?B?YVl0K0h6OVVzNkhBYUF4d1FxZ01ocXlOVWtSMEczYUJ2SkhNM0pVUEFTdWdz?=
 =?utf-8?B?aHNmZ1RlcVNmaytIYnM5aW4xRnhPY3JHdGZlY1ZtdkFnWmR3d0l0ZUZoNkVW?=
 =?utf-8?B?Vnk5cE1pMDk5MFFyMFUzOFpIVVpvZEZnbDVRV1dZR0c5NlVFdzc0RkovN204?=
 =?utf-8?B?amJXWllqTllCNllmYXRZbVd3NStEV2xBUXNPanRTK0JQM3p1ZElsd210TGpF?=
 =?utf-8?B?d1UwT3Rham1LcnVVRHpwak1RUjBPTTZQcStJSGN5enhESWd3dnVPVHhOVnVk?=
 =?utf-8?B?Nzc3cWo4ZXQ2OXE4d2FUcjVwNzNFYytpVmFTelZOUFlSNjY5MlZrQWE1em5T?=
 =?utf-8?B?NGowOGNBSTJaQ2JYeFAzZ3l6Y0ZUYkhKK2tscGkwRVhYWGxvRTJTanpzQk1o?=
 =?utf-8?B?QXJ1SmNUUXV1VFVtWkprRzg5ZW51eEg4ZWIyTmtleHkzUTdUVXc3blVhU0RG?=
 =?utf-8?B?RE45c2xaVFhYRFlQTGQvOEJWaHpCZTBjZE4vNW9SVzMyaDhkVGxOMVJZWUQ3?=
 =?utf-8?B?UjZYOU8xNnlRRzNXZzNKVVVFaW5hUVdqQ1hTejNPZ3ErUU5KdEFtOFFCa3Ry?=
 =?utf-8?B?VmV4dWVaMXBPVGFJTTFYSFZIaE1SdDdJcDY3MllwNTUxZitxMkFRakFZUS9l?=
 =?utf-8?B?Y2VnK0xqT2xmRGRnc1V3NnloTEx3YU5yQXA0akl4dXkyMTVGZS9Db21IUjdL?=
 =?utf-8?B?MGhEOTFtSGZMcHg3QlRtZGhtSjZJdGluZXF3MGJYOGxjcjlCazZBTnRlck5w?=
 =?utf-8?B?TWlRK05qQUFZWi90QWFac3hKKzNPc1ZmRjk1K1FuRFc3eFZaY3FqMFYvd0dK?=
 =?utf-8?B?bHBPUzErbmZ4Ri9hVjRXQkpzRDhKdGNzOUlNeE13OWRtR1RoSG9wL3hEVkNM?=
 =?utf-8?B?eTMwN2psTzZPNnpuUWNGclJlV1hNWklqNGU4OCthMDYydUNCdU5nWi9SdFIy?=
 =?utf-8?B?KzNXa3dRTndTcGlDUTJ6T0J5aEpIZUxtMHM2VkFnVTJpZXAvb3ovOUNlOFZj?=
 =?utf-8?B?R2FRbUVQWmd0ZWw3MytKYk1LNFduRTk3R2tUZ3RSWjJHeEtvaXFRbUlkOWZR?=
 =?utf-8?B?Tmk5TkJ2SHpscUQ3VGJvMEFvZm13Vm5OanJJanoxZnRGQ2xVRTJteEhUTW1T?=
 =?utf-8?B?OFkxWVBqWSt2Y1kvZkpteUxiRzVBY2NRMFF3R0RYVzM3ZkttMVBEeThmMmRm?=
 =?utf-8?Q?f/ngsd93Ab3vTS19AQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TTgwMWZJZDFDOU0wellqSDRDMWdvdWdsTFhlSWYvOWtuMmxjYnNVQ3lUSGVz?=
 =?utf-8?B?THR2dXY3VXdZYVppbldKeE9ZYXBlL25JbUluakpndWwxS0cxQTdwcjJzd2pW?=
 =?utf-8?B?bG50SzVQYjJqTTF6V2w1Z2FCTXJ4K3cweDk1U25iTWF4YWVwSVd0d3FyckdI?=
 =?utf-8?B?aEdHWGtBdjJoWmc1b0xQVXd3NFpsRHNpZkxPSmdrR2xvSFJ4bEVtS2FoVGd6?=
 =?utf-8?B?RmMvc3dsQ3VaWEkxdXc5RFNDS2lwUi9RWlptYU1RbmZ6aVI5eDBDOVl6MDdS?=
 =?utf-8?B?QkdoOTV2KzQyK0VsQXowOTJtUjBQc1dkM0pTNTBVNHlNTVd2eWt5MGRGMUNL?=
 =?utf-8?B?WWJ5dEtEdkE5WmkwOE5Vb3VnZEJveVR5UzdEVWpocGszUEt1eFF3d2lEL2g4?=
 =?utf-8?B?ZHNJTkZEbXY4K2hNdjdvTkhMcnorWnRRQndjc1JJb0FVaGtaSnEyQ1pZSmFl?=
 =?utf-8?B?NWFibS9hTVBtMmpFT1RHZ0RkRyt2MmFmUm1oc2o5TFRqanRtaTZMc0M0NndX?=
 =?utf-8?B?UGM2YWJCZk5EZkV5N3lwZXVsdzcwK01lT2VjN1JkSFZnV21YSUhlZGhCTzZh?=
 =?utf-8?B?MEJ0K2dRTGh4ZERNemRMYW1pakw5bmRZTnJjc3FKTnp3VTFvZXFHT2lvUlFa?=
 =?utf-8?B?V21mazBNVGx1MHdSbUV6S0ZBZkZzcDRrbGVYOWhzcll1eEI3MTFFWW4zOVBk?=
 =?utf-8?B?Y1FoREJBR3ZvN0hoZ0xPQzR1VEJSRVNOUzhSSGpSVUxHeTdPUVcyMCtZWlFV?=
 =?utf-8?B?SllZNTlWK1dnVzlUc1k5Q29jd2lIVG80Y1ZvNnNabkMyZnF5dEtONU5oSHNo?=
 =?utf-8?B?RGt3Sm1rcWJTN1Y1NkRtQnVpOFMyRU5tK0J5YUxycGI2UzJwZE5SMXZ3Sk9H?=
 =?utf-8?B?eFlON1NJYUF1OVlHQVA1c2ZIT2UxVTkyU3NqL28wSVRaZHJVdEpVRDBXWkdu?=
 =?utf-8?B?aEVna00wMXB3YytwZitQWVp0K2IxQ2dpd1QrZFF5elFjMnZXSm1XeXNCaG5I?=
 =?utf-8?B?cmwxM3pLR01LRll2MXEvYjNXeWlWeEZZdXJIaTAwRCtjN2daazhqRldhaVQ1?=
 =?utf-8?B?UExPVnp5QXZCTmNQeXh0M2RhYzdBOS9BQ2VRbW1oaERDTHNNK21LMWp3RVhp?=
 =?utf-8?B?ZmFhc1duRXh3UU01dGx0RnkxQnc5MXZFWXg2dEFLcGx6aFFYY3N1Uy9rem1z?=
 =?utf-8?B?S2dDWk90WXBzN1NYazhrQm1LTTdNOUNVS2hlcitHbnZMZS80MWdIZTVNTWxz?=
 =?utf-8?B?dTM3TW5pdGhnM2JGQTJwSjRDSEtDdE9HRytoZW0vYW93eldiZUFObGtNQXo5?=
 =?utf-8?B?ZzFYbDVlSnVsN2VUUVk4Ky9wWVlRQnlLcHZ4MFV4RnVaQUlKTEUzOGVRSWMx?=
 =?utf-8?B?Mk9vOXAxUE1YUjZydXlDWVN2SXJXOGdOUEljeGM0aENiTHVITUlNVVdvbW44?=
 =?utf-8?B?Wmo4eDhpR2cyOTJRaHlHUHVjcFhQQjhsdkdOUXErQndwOHhXd1ZUL0d3MUl0?=
 =?utf-8?B?WmdwaVBjNWdlNCtLZEltc092NjVER2ovSDRwbFFvSWpReEdLOGhJVzdRRGRB?=
 =?utf-8?B?ckFzUWdlUTVzYnE0TGZiYkV2eHNUanNVS1dsUmw4Uk5seDdnM3ZnLzJXVEd0?=
 =?utf-8?B?N1llaVYvd0FWd0JFcldMNkFGaGx2Y1JCcW5hZVJkc1NYa3pDRjV6MTI2VDZ4?=
 =?utf-8?B?YnVITHVWZ2VHNHNucm9laitnOUpoWGNOZDZPUWE3R0Fjdlc5UENrd0V6eEZE?=
 =?utf-8?B?SUIzQmQ2VmFUblc4MVU5aDYzZWtsY09iMHlESXMyWjhKZjJnVEgxTE9zM0ZV?=
 =?utf-8?B?aSthM0dKb25jd1E0RkM1SEE1SWR4eHNKTDlkM3piREdPSXRra1hTNFdRd29q?=
 =?utf-8?B?TzROVVpPV3plZlZsbHM0SmNMMlAzYmx4Yk02MUdFTkExRHgwYUZJYTZmQ0lp?=
 =?utf-8?B?QWFXMFdpOERnYlJmemU5cFNONjlySHFPdlFWWkZVZ1ZxTlV0bk9vNHFGNlRy?=
 =?utf-8?B?T3NWYUtYVGlyNGp6ZVlGaE13YWpJdVhOa1hLN2R3eXB0TFFIR1JWQjhBZmty?=
 =?utf-8?B?QUFTTGVYRTVnS2xPU2lFc2g0S0lWOUNKbE42ZTBmYk1kQmdoRHpkRXVZY0tY?=
 =?utf-8?B?d0dFaW9vMWgvQ3V1a0U0VkFrQ0R6THIraTZFV1Z1Z09BdkhTTDdFenVncTVi?=
 =?utf-8?B?Z2c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a69bba80-fc0b-4173-d545-08dd0a317fba
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 13:36:27.0183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: az4UDJc6YkO9FL6/dm82C/2L3Nwc78BO6G8ddHEgwdkwoVowAP2XMKumOXmlrqM5AkxTkg9CvMEUoHWPJspkRiyePNe+kdmHN3swP3/NloU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7535
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 Nov 2024 13:36:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5790

Hi Alex,

On 11/21/24 2:30 PM, Alexander Kanavin via lists.yoctoproject.org wrote:
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

