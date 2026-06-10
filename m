Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B152ECD8CB2
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 15:08:09 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.20])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22824.1781104079205288739
 for <docs@lists.yoctoproject.org>;
 Wed, 10 Jun 2026 08:07:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Vy3vfuOP;
 spf=pass (domain: cherry.de, ip: 52.101.66.20, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ABEwaN1U3SgOmvyaykdhFWtGQBirFliIk6AJ+70HgwET9tMBUlGU6h2trZJCfEV/HGme6L4vmX5Zw/zL7kiE9NTW79VNMTGwBFuBaWHefgycITQoRe2sfyJtUmL3lVMB0JJiaoiQ/SOnYsEuaACZLdDpdq4zSNPIPgMpTmjFaxxKoMUAz1v6JD1PqOVd1Lcbd/eYU7MC24iAKDCpF7KvX7Ldmjtt5P/g9Df1m+dvxON9uZCg7/90/IeS296RuX4JOk2sGA1IEr48NTzyd4y4s188VlW16cj1Bwt6U/x+Gmc/MmpOQKAeKclJ/9LEBLhXHmppjBaKWgXEJuc0BCe7AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UDcYv2PdlWiCadaWZZQKV0G3MLgGw+CB3VDS0h6SiHk=;
 b=Gg2Ic3uyzUmgEMEYlG2z7E43gr3HPdh5KmTI9ga40tBWekjuzvpg9bU6UfytHnlSWlgCHzx0ubCkphfY41y4rX7i12dUZo8TU2LcZoL84RMXnIH0IWMC7ZxPkmTSQ+DcdwphJscEgpzTh/TWdM7yhIxREWb+f2+vjOz5mjj7JjlWhbZ2Jno1uCMhpyb68Hdyzjxx4DTm/l/HCI4pZWf0AbHyjsrbjDAleadQn+LMdIfIOJ1ZCPT6PP/sQHVdVya8gjJOO+YgPmFiuTFbSXftsQDCXhqTx1N9Vq9vPFNjpOfGok7Yb8iydXUzZcPWAunksy1BfenuPScedvgllsl/tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UDcYv2PdlWiCadaWZZQKV0G3MLgGw+CB3VDS0h6SiHk=;
 b=Vy3vfuOPm3JBQcKWuWs9BmwvwHVzCTTmYP2ZcxKWe3KS5TID3uXr1o+mzdSnxSujDmpBii0cIfJ1ZxZGGxgY3WXPwITAJ60NZYPkL2QBGa2KAF9g6m/CccHB51DhbpEA4JOheQ75P1ziwPK2JgrpgigevetpXoLWWLzxVX0G0Oo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20)
 by VI2PR04MB10219.eurprd04.prod.outlook.com (2603:10a6:800:22c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 15:07:54 +0000
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7]) by PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7%6]) with mapi id 15.21.0071.010; Wed, 10 Jun 2026
 15:07:54 +0000
Message-ID: <9d7fab77-3006-4764-970e-08347f05e41a@cherry.de>
Date: Wed, 10 Jun 2026 17:07:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v4] Document shared state signing
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260526-sstate-signing-v4-1-e6c91c460a21@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260526-sstate-signing-v4-1-e6c91c460a21@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIYP296CA0012.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:29d::13) To PA4PR04MB7743.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7743:EE_|VI2PR04MB10219:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f94b80b-110a-4032-491e-08dec7020bfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	IpSrN8hOvaXDaCwd1v2yi/comDUT+Tx490ShftuI4lqIWl6wcuQosn2AKj5/S1QfpDXfo06hQncNdSZkUHI0Meqaxzgs0vqrWolVOEYShJyPEklKm+4lx6uoufbjZPWVxaAnh035Aa3XjRQu4pvLzRcHrzD8UYAVAIHaAH27BffYLw45vX4cK2b46s/RYW02UbSjcJdX0Lr5OAd8hCsu7TW19ZEtxHa6Bktsa3mAq8xKtsr02/ylh1XdWncr/BQ8COZY84rmfNkxqf+74eptTKnm2OHHb0hQZpknhz1hKY/Tswoc4OQcqSdtafW6UiCuSE8d2UoUIIsDRQOjftdiySI5A28Hs5B4yRCPemHS3ml7TrCr7EdISaZ3zqNDPgR4RYCRxIhm9O4xrzkY2110TWJ81YErUZSWmn4J04AaVGY+nUqfLPHjQ3cPDnapzbOLgww8cQ1OmPvKjGQrAMx7WKAeEzLyn5wq/qwDIDp89hShieR8SBsFp394f56xqOFJjvuaQN9FeCj26lyxmShSHANDlUgP57YX09qP49jrN4L1TvWOIYvq/4U3gPr+wFxaa0RXCJGSAZPFpLnZZ/8SPfBsIOvlos1lXHpTeYooZiaL8uz1r3fn1d31ha9WuOpugIQ0bbl266mN7nxohlc7UXv8jn4kiEmYaLcy7IP+Cb1w9veNNAj51gLXSVdObu8s
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7743.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?V1RXcGhHUUZHQ1dHNjRTTnQ0ZS9FeXk4TFloaEIzZk90eWoybmd2UW41eEF0?=
 =?utf-8?B?eWhuTWpFczh1aGJJeW5XWkdhd2FvOTBPQjl5RmY4eWpJZXl5VFRIN3NHMXdq?=
 =?utf-8?B?UGI1czVvOCtXM1A0b1c2VzJWVFFsV082T0Jlbi9nYTlHYnF6eTcrbVVUbTh2?=
 =?utf-8?B?eC9NOWl1WkhlYUozMGlFSEVidmhLenRDbDlXdVJKaEFUNVYwbU5rSDMyZjl3?=
 =?utf-8?B?YjVTSXpFTmNYMEpBUkRlT3ZCUmJPMWo5bGhjbmpWUFpNVHpPV2MrK3B3TzdN?=
 =?utf-8?B?b2dNNmJFcE5rM05zRDdLVUg1ZGhLM0dkeDM5MityYUdHUUEwc3JHMGVKdjZF?=
 =?utf-8?B?TG0wWktNQnlYVUkxSkZFN0VWZlJmV2tKRWt4UVlzcTBadnR4eFlBalc1KzdK?=
 =?utf-8?B?dXBRL1NPVVptRCsrV3FaaDlndzZMR3FNZXI4M0VubGlCSlBXUWE5MVpIMm40?=
 =?utf-8?B?OStHeDBSd1d0TWhLbE5jd0RpOVhzTC9DS2NCNDBvZTNpb1NnZ0xVMmdWMUx2?=
 =?utf-8?B?ajhwckNJU2Q2TGlTSElRZFFocXJTcUtYcDhPYVlFbm90Z2Z1MW96bjVVZmlB?=
 =?utf-8?B?U00zSnFEQnppTWZSVzZndFV4aWx4WWNvdU4ydVpCL1dHNmNzNjVkanJCNmNt?=
 =?utf-8?B?bmRobmVBbUlIQU42c242dUxWS3JieVFSa1dKNGhNcFRmNC9BYkNVM0lDdTVv?=
 =?utf-8?B?bm14NlZPcG81azJLT0JGbmtwSExyeEdIdGV1R1hMbW9KMjk3bmxFaGliYlNk?=
 =?utf-8?B?Ym14dHpESEtaVjAvOTFiWlZtOFM4NENKRDgwRS81dWRTOSt0K3ltcVlrdEdv?=
 =?utf-8?B?QlBqckdmak1PVjJIV0tCbWJKM1FsY2JUSXNGUFV4Q2hOdkl5SW1DUmFNcURv?=
 =?utf-8?B?YUtYS0MyNkQyMDhLTUk3bjNTL25CV1R4b2pBeGlidE5MR29wVWVkK3hxVHdR?=
 =?utf-8?B?ZEV0SDRZT28xZ0JnanYyemxZdG1TOENoNENtTURJUFN3ZzdWVGx3ZyttcE1n?=
 =?utf-8?B?b0J2dEc1OUdvOEZCRytxR3I2K2dJN01sTUc2YVhwMUZyNGJ2aE5xSVdKSUFr?=
 =?utf-8?B?ckw1Z2JQWjFJTHltN1dzK2I4ZkxzV3MwZTc5WkFhcEJzZ3hsY3V0RTlwc2Ri?=
 =?utf-8?B?RU1kaVNlQ2YrYmkxQkEwZTBTVkQvOWYxZTdNUnhwYlFodDNFS0wycE5MTktM?=
 =?utf-8?B?M001eTF0R3lJdVpUNkRQc3NXVUpQY09zQUk0dXhaRGpuZGZNSlVzQjUwSkRL?=
 =?utf-8?B?L1V4MGtqeTNtV0NoQmI3bDd2ZUJYZk9EVi9zWGlVTlpSczJKUk1KbUE3Tmtw?=
 =?utf-8?B?eGlIZ215dVRDSGJjZDNGNWFaSkZndUFRMHgyMmpMenk0YTRmcjBZSTBPVGZa?=
 =?utf-8?B?M05kUXdoRlBtYVc5UUNGbVdQM1FVcE1nVmRIRmo3K25HSDRKQys1Y3hEdVdm?=
 =?utf-8?B?UDhpREtQZTQwc0thSzFLUC9Vd1FxcXV6QUVRK2JqU0NObGVLVS9PT0NGZ3g1?=
 =?utf-8?B?RmwrNzBsWW1sL3Z6RmQvMnZ3cnlMNW9OZzkxcC96TnhjTU0rSHV3V3pnVFYy?=
 =?utf-8?B?bXRRTUxJY2tySzhaSm5LUmZqRGFnMHgyODRMOXNDSUFEdGVWTmpVQjhxTTRn?=
 =?utf-8?B?VENLTGJycm8wK2hmR2ZTRVRTbHlXeWgyOHFRaTBBOEx3Sk5XVWxPS3E1dWF1?=
 =?utf-8?B?L2xPOGhOejdBYVFvVlcyTnBWVlgxQkJvQitXNVdKRHFwOUFMVlhha1RMVWk1?=
 =?utf-8?B?Nkt0dGdvMnlodFFpNlhVb0ptU09ZZDJ6VFAvYjBRME9hSzYrblNqZmJTNDRE?=
 =?utf-8?B?OEI0OU84c1RydXNiTkNaUjhCZnh0NFhMS2xpb2ZSeUFDcUQxYy9mRlJIaUk5?=
 =?utf-8?B?Nk8zaG5ucC8rQzY5VVlZQmJYSUtaN29jWEs2UGgydFpkZEFEdXpub3FGa2Rw?=
 =?utf-8?B?aUJHMFdGVlVObHhQUFZzdW1tMFBPa3BKZFF4ME5KZkVtYm5VVDR1Rm9VTWtk?=
 =?utf-8?B?UXI0T3k4NVRUeDlJaEpXbTR2R3pGbEl3VFRtV3k5aU9xcThnTytmR1g1cWtp?=
 =?utf-8?B?RFd4dHg3eTh0cGxXTm5YdTd5T0FpVlVjd3dSVDMyWXQxNU12T3NPSFBqOGJ2?=
 =?utf-8?B?azZCOW8razNyUGpPdXR4M05DaC9MaDR6Ny9ESXNIeFA2NG55YVdlWGNVeWFV?=
 =?utf-8?B?SzZmMkFFRi9LUHNSQzdwYkpjWDhUTmFYRG0yK2UvTkU5b0cyeDZyUmpiTjM5?=
 =?utf-8?B?cDBUb2ZVUG5uaHFhTGk4SVFHUWN0T2hHNnNDcUtMNWo4TW9OYlIzOHdQZHN2?=
 =?utf-8?B?L2FBOVp4aTlCUUczQmtBd25QeW14TzZSUW52c0xMOXNVSGdGa1ZGZz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f94b80b-110a-4032-491e-08dec7020bfe
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 15:07:53.9948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a6B/yXPFqausVlLOTgtRwKCWcfBLUtrVBB8+ndetrpLqRyVcs/olkciOmc9Sko7eSZEgygF4bL6wdTl1JznyiDWmvawXxO88APIZpqDB8ZI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10219
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 10 Jun 2026 15:08:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9683

Hi Antonin,

On 5/26/26 10:18 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Document the shared state signing feature. Add a new document in the
> Security manual, and definitions for the variables involved in this
> process in the variable glossary.
> 
> [YOCTO #15217]
> 

Acked-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

