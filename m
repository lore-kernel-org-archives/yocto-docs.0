Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AF79CA5FA3
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 15:58:17 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9663.1768924687684693271
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Jan 2026 07:58:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=F6H1GOEq;
 spf=pass (domain: cherry.de, ip: 52.101.65.56, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z16yfMWtVhaKnMOzPocNGQT/ROWfZlwdZcpfRmoAe4f6pmCrpio6MJ5wjENKfqCJLLupr9LUBcnxQjVBM4HQjVIeSKGDaDcUzAXxJEmjGH6yABKZsxnw3XrgYAdg+8tDwDmSsQFryNnIrRQcomlRrGU6rpbM/jjOIjQq5TPlMO6aouQqv+UHhHtw3cFQXE+Pc4byh7BGUGtzaZBiouxJamFqDjpCxYPRHOlQXjCNqATgQ100yx0CPlDx5guiEeVfpx0e0tdhN+x65ycPGGc1DmDmnW3yhWdtWu9tv3ZKxkR/0/t/ZUlIg+sVd862tHWkshNmGq+akCj7MueUlxyVVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jXqedONCOxKjHUL0VnqTf7RuBqb7Np3YtH5WBg7d9h0=;
 b=wtKhQyTVCQq7spZv0WBHJYUlUCIPP6kMTcWc0KM+no8Fav15dUlkQnvpaBvzVNsYAWnPxoDTNg8Bcm6huG/WAUC8AnswxjCx7KHLsLPHsjoXG0uUXPXvc/PN8S/jJm5XQRa1iTJlCN+NQHR3ZbSPMhhO5bTytthjgt1JqvVIrfPGiRK3S0XCeCj/wuaIPrNqVxN4KnfmTIzPrmq0vhXu7X/R/Xpd6f5soKElsE3n0ea17JiQ4C5V4dHSwPHzVpYUorPNr20c7LQbOHEtRW+NZs4t7qQOHkZFii0WVlChMkQGcV1XhLlRu8OX42pUHW8hnBGB2Pic3YwW6MWCpBoRMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jXqedONCOxKjHUL0VnqTf7RuBqb7Np3YtH5WBg7d9h0=;
 b=F6H1GOEqP/ikDE7dE0IQGLOcVZvzBetrJ2biYKkrA0AtPFi8SVSHVfEn60trdiIL9cEMvPpGpJgX6daa5hqubdkgBk5TbO3z5QbaQcOLvwXCI+fa9gB0nraI49gB17elOCu6CVRpbvuettslL35NS8OANA77vtejclIpZ/Zj07I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AM7PR04MB6824.eurprd04.prod.outlook.com (2603:10a6:20b:10e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 15:58:04 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 15:58:04 +0000
Message-ID: <4a26f717-de60-431b-a0cc-58d114bc72cd@cherry.de>
Date: Tue, 20 Jan 2026 16:57:44 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 3/9] sdk-manual: fix improper indent of general
 form of tarball installer script
To: Antonin Godard <antonin.godard@bootlin.com>,
 Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
References: <20260114-code-block-misc-20260114-v1-0-174a6e5dba69@cherry.de>
 <20260114-code-block-misc-20260114-v1-3-174a6e5dba69@cherry.de>
 <DFTIXPMPMPHD.1GCI7XBA3UQ3D@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DFTIXPMPMPHD.1GCI7XBA3UQ3D@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::19) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AM7PR04MB6824:EE_
X-MS-Office365-Filtering-Correlation-Id: c10bbcab-e6c7-4cb6-ef7e-08de583cb1d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bmZLZGdUQ2tMOHVnL2xMWXl4dXJkeFRMckliN0YzYnVKZEFsTUlmSXFoY25a?=
 =?utf-8?B?Rm5CMVBkZHlYVWFQdnlTMG50dGpWNjArVFFwc3RON2ZkWHFvcEV4V3I5UVVa?=
 =?utf-8?B?WXhWY0cvQkpwSjlIdUxPME92YnYrNm5FS3Z3UkdScWs0b1ZYdkZZTnVEMUZB?=
 =?utf-8?B?dnMxeWROYlZ5dG10RFdVMjN3endBSWx2ak1SV3VKMmJTcGVnSHAyWHJma0NB?=
 =?utf-8?B?R3FQeWNFQ1l5VDZ6WW12c1NKaDd2anBzNTgwQkRhd1BXZU94MHZHZVB4OGN3?=
 =?utf-8?B?UmJaNGVYVUpmRkh5d21GMGFmWU1peU9kcHhnN0VwRitoYUFFT1Y5REQwbmVj?=
 =?utf-8?B?WEQ5VkN6ZWJvdUhoWVhpQndiWkIxYVJyOWlNQm91MEdPY3lBWmxDeFA4alIr?=
 =?utf-8?B?UDhXVkJxNy90ejZSTVdBb3ozWE52N2o5THQvbVNvWG0vWGkybmZsMVNGbjhW?=
 =?utf-8?B?VUUzOHArMkxPZ1l2ZkZpMFFRWlFoMCtnY3B2VmRiYUJtTWJQbE9XNVM2bGx3?=
 =?utf-8?B?cnNJNVJtcWdjQWRHOU9RTHF2MEY1eU9PTGZhZ0paRTd0ZkVpcy9rK25hM3ps?=
 =?utf-8?B?MWZTVHpEVlNnVGlMd0NaSUI2N25WaHltUjRDMmZYdmdlWW82aHUwMlhXN1JQ?=
 =?utf-8?B?UmZ1WXdoR21heDF5WEtsNDdoQndwQjZHQ0JrbFdhQ3A0YWxKQkZuQXdnb2xE?=
 =?utf-8?B?bHU5Q3lPemNONXZ3b29sOHQyWDBVYjNDNm83OEd0bTZCamJDVnZVdXpVN2Nj?=
 =?utf-8?B?T1NPUHpqNXhlcVZFOXlZdW9OUHkraFI2VXNtWHdPd0VJZnhMdm4vTHdHZmFo?=
 =?utf-8?B?cGNPNWV5M0NIbCtxajkyenprOGNlZ29sdjdpUjdpellyTXpQWWFsQnJsOWR4?=
 =?utf-8?B?RGRFVTNvU0JNY0p3VzVEVnIzMkVaODdaankvNTJnQlFBRnBBZWFrUGdGaFJP?=
 =?utf-8?B?cTFNQjVoSGFVeXFvRnZ6VndObG16QkUyTW94WFNSYUxPWHBIQWk2S3EyelI1?=
 =?utf-8?B?WlBXMW5aajlBWXEzMVRFZVA4UUxGUEhyYkN1SFNPUnl5VnR2NlRiZ0x3M1Z2?=
 =?utf-8?B?eDZIaXdxdDhFM1pQRVFvcytyYW1NWHRNOHByR05IU2ZLSjg3QTVWNldvVFpw?=
 =?utf-8?B?bDVYcUh0UmF0OVNtU2lxQVBNMnRIWkdxTVYxWjJZMWc5WUE0NU5ZSnpJK2Fy?=
 =?utf-8?B?Yi9vWCt5S3czM0VUemJtYkNGNFZMVWdrcDZjUFlhSzlHd1hTRjNabElwYzB4?=
 =?utf-8?B?SldqMldyTzRYSFFUeTBnRXMwQ0FodFRjWSt3Tkg4Sk44ak1nWVhKZ3BzSDNC?=
 =?utf-8?B?L3dKazJYenZvcXlPd1Vnc3pzUHhTYjJ2Q0VHM3lkV2h2RUVLZXYyNWFPZWRq?=
 =?utf-8?B?d0prbzFYMWROdUEyelNvYzBnRk9OeHpicUY2L3JOcnNFOG52WXRvZUp2V2xU?=
 =?utf-8?B?NEV2ZU9nYitERlliNlNzWGc1UklMV0hPR2FEN0VkMThTZlVIRHk4cnZRNjM4?=
 =?utf-8?B?aVdKaklsdjVQalc0cmkvaFlXMUVPYkQ4eExsbFNmcE8wZk9BQzZBL0UzeCs4?=
 =?utf-8?B?M3FOc3Y1ZWVrOE8rZVFvMTRuS1JmdXRXc3JjV0tpbVZEaG41ZEcweUwwZlE3?=
 =?utf-8?B?WHd5Y2hPMUpQUm16Unh2a0pndHBWdHdnaFptNWpGMDljakhReGE2R2RZc21K?=
 =?utf-8?B?b2JPTGNMbVhtb2REZ2c3dlFIQ1RZMitFQmI3QkVaUXl6R3F1VGFPcXpIYzlP?=
 =?utf-8?B?SU0zcG1LZnhyNERZZ3VGWjJiU2Exa3FlanFLU3JJbDhvV29rSXdBODd4bmNW?=
 =?utf-8?B?OXBYcGdyYm1neVE0YkRMSkM1SWpFaDNiVEM2WWJBS2FVQnRLVnh5ajVKMWV0?=
 =?utf-8?B?K01aVVZ3bkRzWStZN1AzRks5SXFVNnROQUljSUlBYXZtWTNyMGZXRmp3YnI4?=
 =?utf-8?B?T3FSQ0pqaXA5blVnUmF5T05pYTJOUjhEdTNLQkd5RlV5ZTBUbTZ3N0ZRUWlR?=
 =?utf-8?B?OTVuek1Na2h6WlFTTzB4N0U5LzJ0R0x1SGNyU0o4Mk5GeDVVTTdMeHpPRDhV?=
 =?utf-8?B?bkpjcENZd3FQYWFHaFFPdmphNUEvSWRVR2c1b1RQQXRxU1dZYi9tRHpHUGRm?=
 =?utf-8?Q?Q+Rw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eGFCR0g0aDFkOFRuNTIwU1prVEx1UmcydGM3Vy80UVNGdkJVOUNYcUF0c3Y5?=
 =?utf-8?B?aEYxRGJWd1hsL1EzOFpRSHBILzNZTTluNnd2eEdmaEVMUEQ0UmE1cURxK2ZL?=
 =?utf-8?B?bEY3dHZqMlZ0eGJJNllSOVVxOUdqWjRVVlg5NFVBbnpxdlFYMkYyZDloWlJ4?=
 =?utf-8?B?cHNwaEFmcjRIY2RCdlJhSDhvRXcrbXlLWjRwUE5sOUxkQ0x3ZENZMytsV1pv?=
 =?utf-8?B?YWUvV1VmMlFIRXJkTzdSRW5LcTBjWVlhUFN6RGdHTEg0M0FJbkpoNU1nTlg4?=
 =?utf-8?B?LzNzVVhCc2wxS0ZuakU2SC9vQTdNWEhKMzJUUjl3UkxCK1dUT1JJeGJjZXZ0?=
 =?utf-8?B?dXZNRW1YMVJKOEhRMklHVEVzNXU5eDBtdTNKWHlOWndJR2g3bG9wSWJGYzl5?=
 =?utf-8?B?ZFhhZzhjVFJya1Y0REZxQXEvYlpqN1hKSjRBR1RtREpXMHQ0Wk9WVlFwSXZ5?=
 =?utf-8?B?bEZjSjZjSFltOFdJWHhETFN1MkpwWWhSTm9RVmFDSWJlYUdnWU1lZjgrMHln?=
 =?utf-8?B?QkJRdFNYU2ZkR3dpVWFVMHNvN0tKeWUrK1NLOHRYckc4TlJjaVloUC9ZTnAr?=
 =?utf-8?B?S0lWaGRtSU1aanRZYWFPbnhkRmhxVGI4Zksycjd2YzRCL2hFaFoveDdQLzd4?=
 =?utf-8?B?dGxjam1vTlJIQ2ZHN09OL1lFd25QSDJDbWhMMjdvbzU0TVNUeFhnTERHeHNj?=
 =?utf-8?B?NGlYU29KenlPZmdGSGQzTXdVeDd0KzRXMlVTVVN3VFM4TDhOUzVORHVSckNv?=
 =?utf-8?B?NTR4Z3JvTnFJTDlUaXVXTkE1ckFrKzZtcXREWmtQakMrd2JQemJqYnJmMitT?=
 =?utf-8?B?VFlueWN1Ung1NCtlMHNCSnRzUzJJZzcveHlHRE42Y1k1K3g3d2F1SGlidC9B?=
 =?utf-8?B?SDc3dXhLSjQ5N3VXNW5jVzYxaDViaWMyZ1JVNWhkUzRHYTJpa2Q3Y2FqYlJ4?=
 =?utf-8?B?dGlmQVRKT1NURHVvTlhqTXZ4S2JGN1RQc0d4K3RlVXpEM2VtSFhBellvVThU?=
 =?utf-8?B?cEhNUVNhc0loajNTY1ZsMUZTRnlLZTI3Z3lHQkc4N21TQWxxVkVLbnkydjUy?=
 =?utf-8?B?K2w1OVpURkM2V0FGM1lTdHY2MXpUd1hDMnB3UzQxaFpqdUtET1Fsenp2TVZL?=
 =?utf-8?B?b2d0L0tCa2lVOXQwSTVvRHpMOVR3bjRacjVZMnFyRCt1UExmbzFvbFAwNVho?=
 =?utf-8?B?VXhJZ0lxMGplRkxWN0ZRSXNyaXZLdVF1YlhOdUM1QTdySGwzbTBibVlyUEp1?=
 =?utf-8?B?ckcrd0xQVXIyMmZ0MEs3VW9pWWNLZkJ6SUdJZUx5TU9RVURibFBzaU5CSk90?=
 =?utf-8?B?NDVMcFB0WG9JOEtqdE5vTmNNWXh2US9jSlJMaCtoWXZLamptRWkrc25KMVVJ?=
 =?utf-8?B?Y2w0K1FkQkFvemlXTHYrRVEzZjJ5cnhSajBXRTJjZHRvS0Z1bktVanp6Mnk0?=
 =?utf-8?B?YmJibmltMGxjaW5FMy90MnZLN3hjUTVUQ1ZOeHJtWnh6c3BMdVVDUVhqSFJZ?=
 =?utf-8?B?OXJGeGRvTkJwMlY3NTFLQStZWVljTXMybC92RDN2ZGd3QzlUdHZMYmVhNXov?=
 =?utf-8?B?SGJjYm5zWXRDTCtuSllGaVVVUXdxQzB1QkJTT0gvSjcyNVEwbm9ObFowOTN2?=
 =?utf-8?B?N3hwVFpNK1lpdjgzcVI2MEp5ei9RK2E4MXVmVUFRODZCOEZDQWtEWHl1THJz?=
 =?utf-8?B?SGxnRG1mRS96MkhPem40WWNncGdFY3o5dkNwc0trSzZaTy9BWkR0VElrdVk4?=
 =?utf-8?B?MDFKVi9xNStNam5CbVZEME5MZUZPcDdpcWJ6Y3djS3JvUlA4Ry9IZHZWeGxP?=
 =?utf-8?B?K0Z6Vkt6R0ZuZWx4Rzh6UTZ4Vkk0cVpNazN1eFU0K1I5VFJYNU1ZMThTQm92?=
 =?utf-8?B?b1FWTHFaams4d01Pb3phVGVKejJwc0R1WW9URW5Xc3BwNW0zcGR3NXZUdVow?=
 =?utf-8?B?empqVE5EQVRIMUNqL2VoMEJtcW9ONGJQMGhQYzFDNWJRRmRFb1NkdUYwSWcy?=
 =?utf-8?B?bS8xbk90cWVnNmJyd2pMbXdWRm5kalNGU1U3YXZhVXVCQkpNejlWSUpGaDlj?=
 =?utf-8?B?TCtydk1PYnJ4Y01aY0E2RWJ5SEh0VHFKZUFlYjlUNjVQSHNWQmNrdFJYNHU1?=
 =?utf-8?B?NlUvK2YxQlB6Y1JHM3UyaCtuNVpjUFFnWE9iTlpHeHBMSjlWV1poYjVOQnJR?=
 =?utf-8?B?UWtOSUplcHpuemhSbFk0eFJVWjVzQW9BeGl5dDFjOVJKV0FZR2YvNXdYWHJ5?=
 =?utf-8?B?NlVDSEtIY0xUalpMMmJtSGlJTGR5ZTI0MnErM2Jra3V0aXNtSTc2ZEdsWU5l?=
 =?utf-8?B?VGpIck5SMTEzenhmR3Rud3VGbkVXZkhxVzlCKy9kSzhHVGl1RVAydFlKRUZj?=
 =?utf-8?Q?0Vh06eIKHJ++GKQ8P6VxhWzmcdF7CWTq4/w//?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c10bbcab-e6c7-4cb6-ef7e-08de583cb1d8
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 15:58:03.9862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FxJdMeuWgSLNrAwbDU7+eQBqNsXRdno5UuknBOCXmdysPX7pip3cm6nMDcyv06kb0oKJr2Hqo9Ue8A9KJvBbBbLyNsa1aqaMCMCw9C0B80I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6824
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 20 Jan 2026 15:58:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8602

Hi Antonin,

On 1/20/26 4:33 PM, Antonin Godard wrote:
> Hi,
> 
> On Wed Jan 14, 2026 at 1:56 PM CET, Quentin Schulz wrote:
>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>
>> poky-glibc-host_system-image_type-arch-toolchain-ext-release_version.sh
>> is in a code-block and thus requires to be indented (it is). Sphinx
>> knows a block has ended when the indentation of the next line is smaller
>> than in the block, otherwise it's all in the same block.
>>
>> The explanation of the replaceable parts in the tarball installer script
>> filename should be text and not part of the block, so let's do that.
>>
>> While at it, reformat by putting each replaceable part in a bullet list,
>> highlight the replaceable part or what it can replaced with as well as
>> putting the replacement on the same line instead of making it a quote by
>> having them indented in the bullet list.
>>
>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>> ---
>>   documentation/sdk-manual/extensible.rst | 17 +++++------------
>>   documentation/sdk-manual/using.rst      | 17 +++++------------
>>   2 files changed, 10 insertions(+), 24 deletions(-)
>>
>> diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
>> index 808e076e6..c3b0c57d0 100644
>> --- a/documentation/sdk-manual/extensible.rst
>> +++ b/documentation/sdk-manual/extensible.rst
>> @@ -104,22 +104,15 @@ is the general form::
>>   
>>      poky-glibc-host_system-image_type-arch-toolchain-ext-release_version.sh
>>   
>> -   Where:
>> -       host_system is a string representing your development system:
>> +Where:
>>   
>> -                  i686 or x86_64.
>> +-  `host_system` is a string representing your development system: `i686` or `x86_64`.
> 
> Shouldn't those (and the following) be enclosed with double ticks? ``host_system``,
> etc.
> 

Well... For the first one, I'm not so sure as it is pointing at 
something in the code-block, so emphasis rather than monospace font 
seems more appropriate here. We should probably use double-tick quotes 
for the possible values though I agree. I'm wondering if this isn't a 
good place to experiment with parsed-literal blocks.

Cheers,
Quentin

