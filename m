Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D378D2D11B
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 14:50:33 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.60771.1768315823648770195
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 06:50:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=LyPKeVuo;
 spf=pass (domain: cherry.de, ip: 52.101.83.31, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K+iFFmf865gB8B76fFlj+B2ZRBbBMGSdL/nui+zdoXXX56/90vII7RqrL1UvL4K82LElz1tK5wMsP5quHDlk1NP0ghoJ7zSAkVXhVojozndLZwHONkqa2xwP4AVeV08fI80d4Lek2mAlYEsRrrUWLzlby585+eRokXHzNYdi9awrLJsH7+3MYG/Ba/Nlf9+MSglUySf6aCs8AFflMobDtUtlFQ2FhFBW2QDRdHgC9NFj+/f51Gp4gG3HnMT0mbjwYOr8lzxz+MAJtTLpCiRRBvf6uBLTcdEfTqgmWHIBqtMxKRShkZ9zgPpy/K0TEvv0G37BnfWE3+fONaTAFyH9Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IYbrVitPEFWQW1yLw3O3o8dj3PpDL8TJveI2U+YDwvo=;
 b=hen0FFp1pQujoNrF5D6TvzcUQFUvaNtDamfEFBlggM7e7N2YGyYqzktous1zWeAD4mShU5xCUzkXKAvV1CH+TwlqtngeeKjqkPe3dETIrnRZ90nH6owpoReIrPgDucMvTJhyLOtaUFO2iJRJFS9236wgJWMe+KNjjcuVEDdGsqB4RwztEIfwGWnhbO37qAs7I11jMP7IACh6em9EhTajOrpT6afbI6PMr86Hb2HNFrl5gM1ST27qF/BAQz0f1gqzZd6hbFlXvcivwca5KgYgD4gd/wGt8crKMunxVFK5LYv43R1tRDgX5R/PZGLPOf/Qtr7CRWDy8wLGqZqMouXSQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IYbrVitPEFWQW1yLw3O3o8dj3PpDL8TJveI2U+YDwvo=;
 b=LyPKeVuoUHOGesXaJo6Kr67+p20xmQTAHS7FiqhdtlHFdCyaCJg3oVo49mvFhFZCSl7b6WuFal+o6HjmPhDhSVXn/Wv+QpEeK2xtYDITVhuFqTNDVhn8gTdzGLmCRX//SCZF/4ZZlu1L6bSXlfTJYVvU64iB8Eipvj3yzu5DoI8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AS8PR04MB8149.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 14:50:19 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 14:50:19 +0000
Message-ID: <ff8d5c9c-3b33-47b7-be0c-54a70d8adae1@cherry.de>
Date: Tue, 13 Jan 2026 15:50:17 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 37/53]
 dev-manual/custom-template-configuration-directory.rst: remove obsolete poky
 repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
 <20251224-remove-poky-references-v1-37-658a5f4dbde2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251224-remove-poky-references-v1-37-658a5f4dbde2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::17) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AS8PR04MB8149:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a036644-0747-4515-b01c-08de52b3126a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OVVvQ21tb3hPc1lYejU2aXB5ZFBZMUdPRUVxb29JRFg1NzMrK2txSGgyS0JE?=
 =?utf-8?B?Y01LdjUzWGQ0b2RiOVdSdmJBMStaZkhiZXlkc21Id0tLNkJFenN3dE5ybWRX?=
 =?utf-8?B?WlM5N3p3Si8vTDBmMFNBUVdjYkpxcnRXSERXeHNMREhaUUNwaHY2ZldOSlVJ?=
 =?utf-8?B?bS9MZWRudndJeFlJWGxpRHExamQzcXZZTm5LL1Byc0tKMVI2YVpnSVNkeVUx?=
 =?utf-8?B?REY5b3crWW4vcytlY0U3ZVRXOWt1ZWxUVkZMSkhJYk5kNlgveGFPbDIxdWww?=
 =?utf-8?B?NS9ORlNldUFBNi9UZ1dNZEpkcWVNK2ZSN1hndVVrVFlLMnF5RzArblArZzFE?=
 =?utf-8?B?QTExOGdkZUpKeTduNEZEVm9IckZ1djVYamIzd1ZWN2o4bWsrWVdkUE9sRDI0?=
 =?utf-8?B?R1FHZVAxSVg4NGtWTzFiR2UrTGhWYlpwdCsxL0RRZ1cyTHNVdXJYekhCZkhQ?=
 =?utf-8?B?VlVpZm16N2srY2hrcGhkbmE1dGFXcXFlZ0hTRTRVbHMvS1l6VzlrTkJnMUxo?=
 =?utf-8?B?N09YSTN0cmlWeU5MeGVlSFNiU0kxa00yQlNPUnQvOFNZMVljeEhFYkFpTmY2?=
 =?utf-8?B?VHVlQk9tLzBQTTBkR0ZpSEc0MVkxZDRhc2w2bHEzVjVNV0ZYWWhPVy9YLzZH?=
 =?utf-8?B?N2VJVWxhNEhIL2h1NU5SL1F3cUxRUVA5OXVjOFEzNExsYXlwL1RzS1NWM2Nj?=
 =?utf-8?B?ZjZ2QTZ1dW5rTTVlbnRDQTNNVHpEcUV3MVl2TnVGK1MweDdXUUorNXhwd1Vt?=
 =?utf-8?B?TC9YZXlqSlQ0aVJBcVN6R1dodTZ4OURTbzFJSmk0aVBaNnVKWitENjN6Q0Vh?=
 =?utf-8?B?NmRtNWR6a0lQdEdLb25VU25Oei95Z3lvN0g2UVp5UDk4TWhodHdaSm92ZnRR?=
 =?utf-8?B?NVhHWmhGYW95amNFTFJ3WWYzbi9BQlladDBEOWxZUHJ3Ykk3elRWaWJSYTlM?=
 =?utf-8?B?eHdFRzdUb21Fam4yOFJvVkxHZ20rZFhQRGdqbEZYWjBWazBwLyttdDRSdjhx?=
 =?utf-8?B?ZVd5SVNJbWN5bmM1eVJDa2hSSTlHOUFPc0F5ZXlmVVBsd1o0eDhSdi85ZDNL?=
 =?utf-8?B?c2VoaDJhSDJ1VHJxNWdBTDdQQTR4alNPWWVvb0tNdGllWThURm9aWThQMlJh?=
 =?utf-8?B?ZCtqWVlNWkRObWNGaGRkZlM5SzV0ckNRNEVkcjFnQVRwaUVXdyt4V0V5SDFE?=
 =?utf-8?B?cjJueXA3UlAySzdGdGdXeWIwbGpERlpVZVlvMFBSV01ralJmOHc4RHNyZFp5?=
 =?utf-8?B?dG1zMkx2L200VnJsNmJQU3NwcWU3OUxsWGdxUVArYUJtSjhhQ1hFSWlYdnpM?=
 =?utf-8?B?NER6dXh3Umt6Yko1NjU5cmNRbTNHMk9yL2k0ZSszbXJiUnljKzRUZExHZWNG?=
 =?utf-8?B?d3B4dFU0TG5mYjAzeERQRmpzVEZhMmVPZm4rVDZPQTV4QjdhMnVJdzZ3OG92?=
 =?utf-8?B?TVdtandIZW9UWCtLa2NmMDRWYXgvVTFiZnZvR01lNC9FeVVaajhPeUlyVnQr?=
 =?utf-8?B?b2hPV05Db2dLKyt3RnZyQnVEZnRnanJudjFnT1p5bEpiY2tHSnNCL1hJa2FU?=
 =?utf-8?B?M3JBL2psNHc0Q1dvSGpCREFoL2VVem10bGRNcHU2cEdUWWtPZzNzRDVBM3pn?=
 =?utf-8?B?eDJyaU8wazVqVGN2QWZzckVzK3QxNE9ycW5BZjJ4aU56V0ZoTjI2ZnpTZlp3?=
 =?utf-8?B?Q2g2bEZGb1RNWGVRWGcwRUExd2xwYXU5ZW5LaCtZVlNsdW5SUWhmNUJqRXRC?=
 =?utf-8?B?RkxIUnFRTURna2VEbGZUQmxsV2ZURDFveXJLS2NzcTdxMWxGNm5OYmx0anJB?=
 =?utf-8?B?b3RMZmgzTWZQWVRlaGdPUEFYZGFmWkU2WGZnbFdTS0lJb290OW9uNzlFOGRY?=
 =?utf-8?B?MTBSU1hPNzVVOE9kVWJhNWlUamMxVGZaNTF4dCt2cnNGSFFoQmlycXdKcjV5?=
 =?utf-8?Q?p7viMozicB6TKrjK5ZNZHJ0PgyfkrgxH?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZkFmNGdSV0FCV3BLNk1lQ3hZUWcvTFg4SkgzNmU0RlVCa2FOMDIzUVRCYmhp?=
 =?utf-8?B?K2M5T2Z3S0JNYlU5dm9Wc0FtaEJkNXM4R1g5aVZscVl3aGUvNG4rdEo0R0F2?=
 =?utf-8?B?aXFjbkttKzFTbTBxajdOZFBkMzQzc0pKKzRHQ0dVN2FNTTlMQUVFUmJOR0o0?=
 =?utf-8?B?aCtkQ0lReDhhL2VubytjeWx1cXpJSWZ4T1JrcTdCa1VIQ1BXZVVLTXRORDNY?=
 =?utf-8?B?M2ZlNmFlQk9JTkNvd0swZmNsWnBLSk5UREN2RUIzV2h0Y051WnFGWFpuT2lN?=
 =?utf-8?B?MUVKMnlId1Y3aGw0VzlTWC81N3N3ajF0UlY3OURHYVo3QkVVa2xzRlNXK25m?=
 =?utf-8?B?SWl6MmRuU25YQk8yQ0lQRHd1WFlBd1dEM3hEd1VFUCtBNHltMllOY0JyRlJn?=
 =?utf-8?B?SUZrUFdOb2U5NW1DWk9QWE5GQm1IMm95eDZyVHZCeHJMUzg1b21iOUZJd09t?=
 =?utf-8?B?MDBnU3ptRDJXdFkrR3ZUMGJLWWRyWVF1clFZSXMyZk0yT09INWVQNWx3TGtC?=
 =?utf-8?B?Ty9Vc2ZJeFVYRnJhb1BPS0VmYm82RlNmUnBIN2hONzBSblNBdW5OQmFiRWhr?=
 =?utf-8?B?U081ME9VWnVwckVqbkJHL205YjVUWHpBc3NyVkEyMnNVcFdmb3lxTEdteUlj?=
 =?utf-8?B?ekd4Y25YSzh2R2haZzNCMjd3ellmTWg1b2Y3cUwrRGl4YVdyenZxS2w5MXk5?=
 =?utf-8?B?KzlDNFllMUc3TjBMdlI5ejFiVXpCcEU2dVJHd3dZNEpmd0lyQWdsUnJ5bGd3?=
 =?utf-8?B?eVR1WGxDL3h2N01aSnZlWUFiZ3EzQ3NMaFhacWRxcXdtRDJzN2VFdWM4VFBW?=
 =?utf-8?B?UkZ5MzFDckY1MXlFL2dhMmUvbHdsc3VwVktVVG9JN1JoejZwWFlSSGI2NEk2?=
 =?utf-8?B?aHRtWks3Vk12N0p0eHoxOVcrUDdYVmJZTjJPdGdUSm9rYnFwTG16NHNwb0ZZ?=
 =?utf-8?B?SW1qbHN4SkMzdllrVzJxSFZobHA1ZUpyNW43SDRPZy84TWFXRzk4Y1hYVzRF?=
 =?utf-8?B?b2NGVjFJb09IOHlmWUt2d1ZHTVdQN20yUEdOVUtITnRrZXJoakJMUHdHWVFN?=
 =?utf-8?B?VUR0UURFQUk3em5pZUxIeE93N1pWQVFQNUc4dmJzUVMrQUgzeWhUZ3F3U0pN?=
 =?utf-8?B?eTFaQ08yeG9vR2VFVjVXR1VmNE0weU5wVHN5RmJnSmtxYStrWkRYWkVuTXJx?=
 =?utf-8?B?Kzl4RzEyRjNySTdrZWZrUUhRcEUxTEw2blNhVG9WNVk0VkhFRit6SzZHVE5l?=
 =?utf-8?B?ZmdLOHl2Y0Z4YlZsR01ob3YzdGQzZXVDNVI5dEdlUkthOTBUNjA1bWFJZnRH?=
 =?utf-8?B?SWNyUkltcjJkU2p3SWZKdXBySDloRVFnL1U4V2hzeTl0Kyswd2pCcGUwdlRW?=
 =?utf-8?B?dVNaaDVFUDlWamRxODhkUm03S3lCTk5KSHB3NGYvcy9FR0xUYW9ESkVMZHNx?=
 =?utf-8?B?ZmdyN1Q2Y0ZxSjlhSVB5enN3Ty9jSXp5MlV5RUllWGVVdXJDTmJXRGtFQVRr?=
 =?utf-8?B?blQ1UXEvNXNXK0pzK1REQk8xU1JXalg1T1cxOENWdTU2bUdSRXRYSkRrbWhR?=
 =?utf-8?B?L0hpYmk5eTRPSUVkNEZxWDJQNFNteTI4RGdVYWZaczBUaFJsMUVQckJ5N25I?=
 =?utf-8?B?S2l6ZWtUdnRlQWxXSFJxbzdSK1h1OE5ZUHpZWTJiK05uZU1MbmdLMUpKdjNP?=
 =?utf-8?B?NS9zTEs4c1psSmRvTXRDQlI0NFJjWUdFbFZnTGxzdDA3WndMcisza1FKYWVj?=
 =?utf-8?B?dk1qSmt0YTBqTjJNN2VVK0pwUGdFY2NVQU5VdzVEak9iMHp5MWE2SC9zRG5C?=
 =?utf-8?B?T3NWUW1tMW5UNGlMK0toeStuL2FTMi9hYXRJb3lLMkRiaEJnZEdTK0RMdXBu?=
 =?utf-8?B?cVhmei9kTE41VERBdVhWTm1mQTk4ZWl5RHhFWjh4WFc5VVMyRlIvcEVobDdn?=
 =?utf-8?B?LzVuQ1RsdVRhWVJsSmNRdHdBL1BxSXduZnpSdnNoeXR1TlRzZkJZbENlVUp2?=
 =?utf-8?B?QXVvb2FSdjh0QkdNd0Y0eXF1WWo5c1o2MU5Dd1ZzN1FKZ0I4Um10a0JnbjBM?=
 =?utf-8?B?cm91Ujh5M2t6LzRvaEhSVFdoVHF3dkNrWXUrV3huVnI0V0VTOHJIQ3pndVBZ?=
 =?utf-8?B?cDdsMGVQSEo1ZkpKRUtncVlWTHVuK05xRzRDdkVFbkZwQzFuT0lBUFJqMEFT?=
 =?utf-8?B?a0hRR3lPTitBVzhUWHRFZXZJZ0pubDZPTUJEdFUvVTNTbU05aUttRERQZkV1?=
 =?utf-8?B?a1NtcWd1aFRQcTV1cldybDRLWW1MK2FHY3VSQVNYU3JQRm4yVjY2Z2djNzZq?=
 =?utf-8?B?RjF4ZTZEVXhsUGNSY241cTFNRXFWckYwS0cvL1ZnUEZJWmJZYjdmQT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a036644-0747-4515-b01c-08de52b3126a
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 14:50:19.6067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yFnFgfq0X4UXfrJh/lv2bNa04OQdOXl/LmnV+IbgGNjQ0EM5q61aJ58FeZLuyGYXxMZXHU6YXmcPGEgW53bXhLWDPJXsFkR+Bp7u4uM2gQY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8149
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 14:50:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8526

Hi Antonin,

On 12/24/25 5:32 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Refresh the document now that the Poky repository is obsolete. Adapt
> paths to match to encouraged Source Directory layout.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

