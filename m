Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DA5CC02180
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 11:32:23 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.18])
 by mx.groups.io with SMTP id smtpd.web11.18797.1736940736517304622
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Jan 2025 03:32:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=llLjWHA0;
 spf=pass (domain: cherry.de, ip: 52.101.67.18, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mwc8dUUz8cL7KFUHNfDJmrE1FSM5o84BEQ//Gs8HvDUX50DZeQhfbQMBjYAUdMfSbnwpsh3x6NpLwPKONEivQU78mpD8V+WOcmQ8cOhvyiFpha9U8sv6+ptNSNem8puFpGFPaEnS+xzRIkpwVPOjgUjw8uXr7g5idV8TCbFSsCq0Xwl8XtB8WGNPmclh1JfkIjXS3MhtKJjB7DHWua7kd6ax3JtQAC4xurxIM0mSWaRZ4ySnvwSTem+TWwP9lptQx5DEjN8fTmKYdxv81Pbk/Hopyr6k6INYFwAxHZf4+shlIRN4/VNspcbbzh2RD2uVdJtmwLPzcrvQhy4wRM8+eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=niFKN5aX6xrUPtOPDe0d35Iv6/6bZmdEies/b4i4LGg=;
 b=VmyRE1C/qCUm94x8vGW2TIE7BFFhUD99CmaaAcnn4kZaGgcW/g4vooBpp/u5hKFEgXlN9TbwkRIaalldMW+5cV/zLzsHztjUf0mzhrSdzVFbNO6PBE+zZF+QwCnD3qjqT31XO8Po2L7+fM5QVMxgqGSu0gar/yqW0z4QGLob1tMueF+Rcw36DdNG0ao1Rzh3ifNDZ+hzDRQjAIzMbDBfGq/8Ja3A0Q9a8vZlo8+idkL/Sy8u/NB86Myj5iB/pG7EUKcvts3BXiNf8ILC60K8TqGNKOGZFjty+WlfkG+JSNNWKmVLEZsJOO2oqEZqU7NJfqexTNbIARBlnCwC8ZVc+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=niFKN5aX6xrUPtOPDe0d35Iv6/6bZmdEies/b4i4LGg=;
 b=llLjWHA0QEY7ap5q+zXGVn4lLTxO6Owtds2jnsXiEkKuWdGH7WUwgpwgxk56urdIGEneSVAyTSji6LrAn8OYmXcyctP4sHijwZqKhb9aBm9B/YKH1nPCXm2QcSCMv2SEH04q9eVVcjb53oTEeuxJIJuSTdlqgKuyYe1+0PSh3RE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DBBPR04MB8043.eurprd04.prod.outlook.com (2603:10a6:10:1e7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 11:32:14 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8335.015; Wed, 15 Jan 2025
 11:32:14 +0000
Message-ID: <58d0a313-014e-40ea-b8b8-e3836e81c4e9@cherry.de>
Date: Wed, 15 Jan 2025 12:32:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v4 4/4] release-notes-5.2: cover devtool modify
 --debug-build
To: adrian.freihofer@gmail.com, docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
References: <20250114200734.4191354-1-adrian.freihofer@siemens.com>
 <20250114200734.4191354-5-adrian.freihofer@siemens.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250114200734.4191354-5-adrian.freihofer@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0198.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::19) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DBBPR04MB8043:EE_
X-MS-Office365-Filtering-Correlation-Id: 852e9330-844c-4f5b-96d6-08dd35584257
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?alBmdm5hRHJSdHdLWm1jSjBpQ21IZzF1SUtPVUNVaG9MKy9NNzlJdWR5T1FF?=
 =?utf-8?B?aGZsbW01NHZOMnZ1bHltdmdENzZ5NGZsOGhYVVkzUUpyRjJ2QTZvMlhob1hY?=
 =?utf-8?B?d1FYUnBRM2hNVUpYWTFSYkgwcElEVm8vMzBWSHc5UkRNZ1hnVFRta0c3cTlS?=
 =?utf-8?B?UFhsRUdLM29nQ1kvd0J1WUs0bTlCdWM1RkJIOUVMOUVkUzF3MTBUMVFNaDR0?=
 =?utf-8?B?T09HZENSUHZjSUZHRnVKSTc3TWZHaHROUTVjc3hqNzlEOG8wcGUzelR4TjRx?=
 =?utf-8?B?UXVpSkJjb0V0QUE2R3R6NjZBUjJMMURRSVZ6L3hDaFltVmxiQ0J0aG5lZUla?=
 =?utf-8?B?djBzZDlRTmtYY0ZvaTB2b2E3a2dqNHNPenl4a2VaeVZTSE8zQTNEQ01raHQw?=
 =?utf-8?B?d1lMRVREMjRJSjNwaENPN3FOSS9WRjBoWTJybDJUV0ovYlQ1TFZSbmhNVEZP?=
 =?utf-8?B?OHo4bUhnYkdmSlZKSzdranNQK29YZlUyUWFwQzZUTkxGWmpINlRvUkNPN01O?=
 =?utf-8?B?ZjF0UjF5TThQSjk2ZXMvaWNLWjJNSlNTaTZqZFVEUGg1ekdKeS9PdHQwWUhh?=
 =?utf-8?B?ZFA4di9ZQUxNVzBpV1dqekZUY1hLRXdPVUpzWUpFa1diS0tiWDlyNzI3MDVM?=
 =?utf-8?B?a2VVa2NwOHdZMDJyK2EzNi9ZMTFiMDkzSkpSNERzaWM4R2haL1dDZjFXRE5w?=
 =?utf-8?B?TGFBMHFIUHlRTzV4SFZwby9iUzg5TnJEWkpEQVAxKzEzTGdQVlBWSURSVnRR?=
 =?utf-8?B?TGN3b0ZLbCtxNzEwS1pQaS9DR0lyM0NqcGlDdzBicVpJUHdJVlRRc1VHTkxE?=
 =?utf-8?B?TWNHRzd4a2I5SVBrTnYwemZRSk1CZHhJeFg4SFl0WkFiRWpQcUVYaWFvU2pD?=
 =?utf-8?B?RlFHOVZkZDNnMVBBVjk1RWc2OEVROW1keHorTTRkY3hyZ3piNDY5QndxaGhl?=
 =?utf-8?B?YjZrczVkTHNVc1R2ZE1aTUIyVFBwR3VVQnEyVm1pU3dyakFzVTZZN0ZKQlRT?=
 =?utf-8?B?VGxhUmZNTWVmTEZWRXhVY25TY1Z3THY5QkZwS0pqZHdIMUZXaXBaMW1aRElO?=
 =?utf-8?B?S2pvbEdZOGptQ3NFcitBR2h6VVZQamZzVVJKeUNaVWVDMkVJOU5HMHIrSW10?=
 =?utf-8?B?UmMzZ0Zxa1lSNnEwYUxmbEVqQ3hmNUZBRjJxOVp6ZGdDMzlVN0hmV3VCUkJX?=
 =?utf-8?B?cXVxQVZMeTFtZ1FSdVNYZnEzUnFrSDFhMkpLa1JNTlZ6LzN3dHdQTG82a3NX?=
 =?utf-8?B?bnA4ZG5FK3h6Zlg4enF1N0RkZ2NsRExjMlhzT1JJZXNSV3I0eU1DRW5tQ1Zm?=
 =?utf-8?B?WEZma2NYb1VOVGlxK0xvNVNqWldCWThpTlFSd1p5ckl6dnNGUDVuL29Cc2JG?=
 =?utf-8?B?ZllnbFBNRnRrVUNya2g2UTAxaXNLYzNZK3c5U2ZxdkJsbGlqMjhZNmcvNWtK?=
 =?utf-8?B?S2hmTmxpT216d2tRMTZDZU9GUXpzZ05WRXJCclJZZTE2MHJzUC9ZcG1nZ0JM?=
 =?utf-8?B?Vy9ubEduQlQ4bDNnNzN4ZUp0LzlScFFXaTAyNTRhaWVCV0x2OFVoQlFSaTNs?=
 =?utf-8?B?THR4Y0oxdEs1QmZ4d1oxajVOLzc1NU9aTU1qanNmVm83OHNSRzVXaVlBczhq?=
 =?utf-8?B?c282NzVoUSs1LzlGWXdmUytQKzRTWHB3MzNOQjdpV2FQd1JtbVB6M2JpdEVJ?=
 =?utf-8?B?SFhqNUZMTEhNMUJvVlZMbjdwQ2U3Q3BIY2U5ZmtOSHh0VlFRSUt5NmJ6QXZG?=
 =?utf-8?B?bWVsbDFDcTNWYVdvbzBRTkl0MXZCYmprMittTnZiQ3BBVGNzdTFGelhkekVL?=
 =?utf-8?B?ZTZRYkxwU0ErRE96VndvamhFRklhUWlBbWJUeWk5STdtWERCZ25DSGpORXNS?=
 =?utf-8?Q?L+JD6KWTA6N8y?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WU5pd1ZEM042Y29hNWRKaTcvSXBtOG5CS1FscE9GMXZnaWh2ZGJNbWtYdGtt?=
 =?utf-8?B?YUJRTVVkVDRCb1hhT1hja0xjeGJhUGxPWEhwTXhYVEJVSlRxUldiSGZjdU9u?=
 =?utf-8?B?OFdnZ3doS3ErN05KRFpNTStVMzR5ak9LRHhvT3NhZDB2RXZ5SzFEbXVvRWhn?=
 =?utf-8?B?OFhINCtpdXBXck5BSEVlTFIrdXZiVlB2MVBGaWNpMHMvZURKQUNORlVsRXNm?=
 =?utf-8?B?MVluL05qTjFNU09nYnh5WVpFNi9XZGJLVGhtbEZIWjZTVllxbWFlb0lNMnZZ?=
 =?utf-8?B?R3FmUTRPZ1hFVUJ5enV1NHlQUHZDbHBVTkF5ekxrQ0NZZGI1VEI2R1R3YWlS?=
 =?utf-8?B?V3Nld05JN21ZV0NXNzQwL1djWG50RkVoRkVNUmJRaittUGdwZ21HbDFodXU3?=
 =?utf-8?B?aExFWDUyOTNjRit3NSt4RmQvN3ZrejR3M2JGOTdCakdZRmt0VVIxYjd4Zllq?=
 =?utf-8?B?N1VVYjRBRXBWVlVDQ0Q4L1paNVZRUVEvS0lmNC9mdkVoWHZoaTV5TEFJb09T?=
 =?utf-8?B?aFJJSVJVaUNnWDNDK09oQTl5YVVCeENmVmhGaFZDbGZVZXNiSHY3WXFVQ2dY?=
 =?utf-8?B?YzZpblFqSWNDUjBRcjZocGU5bzVyajRZSlRPUUhXTXFGbGhpVmdSajNLSlFG?=
 =?utf-8?B?TC83R0VhM1M2eXhRWjF5dEcwZEZpeXBiMDBNNnNDVlRmSE5JVWZaakY4b284?=
 =?utf-8?B?TEU2b1EwdnMwVWNVZ05lSlZyb1JFMVBTWlp2OWZqb0dyUGRGM0pNV0gyNW1C?=
 =?utf-8?B?aTl5WStPeXFQeWI3a1JhQWZLL3BhUGxMTDdMZ2UycC9zcTUwUTN6ZWlJc0hB?=
 =?utf-8?B?L1Q2aExqUVVuM3hsdE5rN2t0SUhFbHRXT1VwTXR2dGl5UUlBdFNrUktHNEVZ?=
 =?utf-8?B?VW1UWVNYR09FWHBDTjBIN3RIMzRBWTNrTUpEclk0NUlkY0VxN2NPNy9hdE1k?=
 =?utf-8?B?RTF1WFMwRklORmNTVy9VMjRla2FlWnF1OVRCQkFrRngrWHU1SldNUThnYkR3?=
 =?utf-8?B?N2d6clp6M3NhRnNwQ285bE1iK1JzT21HRWpvM2ljTFJFdStPcDJIK0ZrRU44?=
 =?utf-8?B?NWhmYjI4MzVLbUd1TzZOWG92K3RoSmJBWnJWaVQxSE0waWVlaGY4TFJST1Qw?=
 =?utf-8?B?N0RjbUZGeUFEODZWK1V4MHFxblhKT0lvYW9mNDI2VnRRU3A4Q3hDSEs5dDJS?=
 =?utf-8?B?ZUZTcnY0eUZFZnlVSEFpNHNtYm9Mck5jdVZHR3ZwZ1E2K0w4QzcvTld6L2lp?=
 =?utf-8?B?VVNVRzlkTmdJVWZtOVBjdEQ3WDZEMVVkZ2ljdGNBcGJTYWt0VUZtODJuNnUx?=
 =?utf-8?B?VloyS0grOXVwckhwZEdTWDRuRVZwaFBpNWpzWUdTZFlBVW1Ba1FFL1F3M0hk?=
 =?utf-8?B?NnJ1OXY1UjhteFpaTnZtWkNwdVZyMmgydGpESkVmMzBIMmdaQ2EyWHFnOW9F?=
 =?utf-8?B?SDFyU3crVURBS21HS0R3Ukw1SGNCUm9vWVppbnE1b1Yrbm1HajlVWGFwWU43?=
 =?utf-8?B?a2dQc0srNkJ2a00yNWNtTFVpOHFHMWU0T3JHTHJmSXo0N3pvcUZueE1mTVo1?=
 =?utf-8?B?aWNBYUFnUmVGdldUNmNrd0NuYk4rMEJWdDJ1TTU1STVvSHZhTVQ2NEFvUFgr?=
 =?utf-8?B?dzY4K0xmSjYxVkdhMm9ISzNkNENXOHpMb0Z1aVZLUnJrSDdUSzVRQnRmZ1Na?=
 =?utf-8?B?YW9BUHRFM3JqdDVDYjdET2twb3p3Qk5jckRNTER1UUZvdDkrRFV2anJ0Z0Fm?=
 =?utf-8?B?bnpNUGRFMWljNVFKQ0YyQXhGTHd1cm1sYnAvWlJyczFsbi9ybk1aNkJYTE0z?=
 =?utf-8?B?K2ovc1d1VU14ZWtMdU53U1dGOFBRM21ud3krVW1ma2w1MnpRSER4RlNsWFAv?=
 =?utf-8?B?S0lCSWJRYVJvTjE1TnRUOTNqMVhXRjhPR2tvejVmNGZLNkJUd2RIVU5TSzZr?=
 =?utf-8?B?dGd0QUc1NmZEY3U0d1NpQWUvd2QzYmxEVGNhYnhaZkxUU2pPejh5bXhOdnZz?=
 =?utf-8?B?ekZMRHdReXNwQytNRndVN0pxVWtabFFXU1pYR2xKZS9HOVUyM3ZMK2piRmgw?=
 =?utf-8?B?NW14Y2lXaFlqdlJSQmFQTDR1akpBMEpSeHJtUkJrS3N1VENuaFg4SCt5NG1U?=
 =?utf-8?B?MHgwZ1h2WXMyRXkzdDVtQ0FaY1didU1zekhKdnRjdHpGbDFVZGVmUzBjdWlz?=
 =?utf-8?Q?2whVyqNRdLgoYFDD9mIF7jY=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 852e9330-844c-4f5b-96d6-08dd35584257
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 11:32:14.4726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wFUL8u8Sc0Bz0myEv5pPapoJ4xqQPY2tlqSGy1cbzUlgOHjXvHH2YSB+RBOa1xhAubQDCgzkkQ7WiUODiZh9rdnHjECPeJqx8xZWraj88/8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8043
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 15 Jan 2025 11:32:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6117

Hi Adrian,

On 1/14/25 9:07 PM, Adrian Freihofer via lists.yoctoproject.org wrote:
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks for doing that!
Quentin

