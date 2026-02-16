Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22FD2E7BDA1
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 11:31:52 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.1])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17794.1771241504938003141
 for <docs@lists.yoctoproject.org>;
 Mon, 16 Feb 2026 03:31:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=TSj/oUZh;
 spf=pass (domain: cherry.de, ip: 52.101.66.1, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W7BBd0uyB4lTxAE4NkVrm2YzZB4k2R9AkqYg2A5lgv1x1SomQXzztkkfMifxGgbYzcBcMXGxYV5OJIAT2YWID3/IsrZL4o2XvL/6pigjPkIVkYoFjS0jPa/Tv+a1ftjIQ6KDIzJmQ0Yr31lLqDT9tRGEBQU7x1VIkFUtu/f/546g19xo5D7BxKJx0iBqZ2hqnIziqTd+Jw8XDdrc5aBwS4Jv6GPYuA3R1RJz969BTWoGBbbakYUT04dUJ0WFTY29cysW5v/IRxgC72PhI47my1lnrp4DH4Q1Qlr3qLU9C2b82KRTQRu6g9oAZCOIeh1UxNDijMbZb2wU4ZhMr6kouQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BNjoWUKsYk1U6hFbIr1RcEaTSWywCMhkRLAteT1DDDk=;
 b=yr3UOiXX7PcK0BUJ8PwEba+AIDqRksnXwmDuJcv9U8DxwmOPcCHMpLGe3dOialaeiowVqHbfqkfiObQd+fzZUjpunbAgx08yOKaiSfJBlRdcZAAksc7kI0e6aXKPu8mOo3F7pdSWOb+wDzUnHXZUczhG4VH2Qvz4c/0c/2FlMG+cmwmgqL3A0Sm0DIbliZyn/4F0oiFDeI6DEvGOFCDRfyemGRie59ClmYtc5OeCsNZm4SfB5e3zFn+GwBpM4FghJWovgvyuD9PtgxhXY+riyCigsLZBuO/Qlns09NkKwk2oSOyZtpu+inY4ay90Xagr9fx4OTRrc2Q+HVHhbfOraA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BNjoWUKsYk1U6hFbIr1RcEaTSWywCMhkRLAteT1DDDk=;
 b=TSj/oUZh/lO15o81XFyfF78NDol8j4KZyNDoMRS1LBspdrOKLmLbDjAanePOr64YdT4pfDYCoLlsLSF0nEW2SV3plnd73QJn67cWDGkokA1cp2G/1HqBzhlQprlG5ciCBXb3vBr4hJ7EbogLRMlklmMW9uKhj3Kqt+Pc06ySTSw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by MRWPR04MB12354.eurprd04.prod.outlook.com (2603:10a6:501:81::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.15; Mon, 16 Feb
 2026 11:31:40 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 11:31:40 +0000
Message-ID: <10723909-ce0b-400e-8b42-de9f0cbed763@cherry.de>
Date: Mon, 16 Feb 2026 12:31:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual/classes.rst: fix broken links to U-Boot
 documentation
To: michael.opdenacker@rootcommit.com, docs@lists.yoctoproject.org
References: <20260216111502.1919905-1-michael.opdenacker@rootcommit.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260216111502.1919905-1-michael.opdenacker@rootcommit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::13) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|MRWPR04MB12354:EE_
X-MS-Office365-Filtering-Correlation-Id: d53f8727-aed9-4e79-98fa-08de6d4ef416
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|10070799003|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MVd3R2RlcGdoMGVueUtqNXdDRHl1dFR1Z2hTd1pnbm5kWTlsdmRwQ0FxZFhi?=
 =?utf-8?B?RTlWMStYcDUxUmxBRk9qcEtWV2d0WWh6Q081Vk9ib2x1L0hqS3RuRnBUVnR4?=
 =?utf-8?B?MFdVS3laTEFaU2Jhc2VFaEZMUXpGZEhjZTlyb0daMVkxK0FEZTFpN3VSWFVr?=
 =?utf-8?B?TzZLTGJ2ejdSVjFoNENuT1ZUVUJhN1grMkdYTExQSzlIMkFQZ1N0bjZ4Rjhw?=
 =?utf-8?B?ekdkdFpLbFdZQzBYd2luN2dMUXdDTkEzNU1aVnczL0x1TVNtU2Y1dTZrZkJZ?=
 =?utf-8?B?cFhyYm9lZmQwWXJHcEw5aGYxalJRUUVmNmhGZ1pOeFViOStLdEpOZFpvY3R4?=
 =?utf-8?B?b0ZLWGo2cXo5UGtjZE11RTFNTmZGVWNUallxWFBOaVhreGJSQzB2cFQxQWp0?=
 =?utf-8?B?c1VvVHFuNHFPdzJUTDRtbDlwQjY5VTBTeUFWTEVUWStaRWxodjBoMUNvbkRB?=
 =?utf-8?B?c2xNYkg0bE95UTVjZUFiQnJJL3ZCVDI0L2Q5c3NoTEpidmptQzdqZVVvU3pF?=
 =?utf-8?B?ekVrOGY4eXUvdEFDWWJmaHdUem5OQks5dVFZdmsxOCtGdGNYelNyQVg3cTdO?=
 =?utf-8?B?RSsrdW5MNkJSMS8xbUxLM0dLLy8rS1ZLK01sZ0lpNjdvbzNlSzVZVEZGVGRj?=
 =?utf-8?B?SXMxQTZLekRxSkdsNDRsK3hFSGhQNXdhaU1RN3ZLdERodlh1TUhZUFp4MzRO?=
 =?utf-8?B?N3RUM1NZcGtXWE9DcGRESDRORUpFNUwxMi9XSHBBMVNNb3hRdE9FRTZjc2RZ?=
 =?utf-8?B?UzJacWEwc1YxaXdIMkE4TjgvSTZZMTNsWDBzTllQem0yUHZ0Q0tsNGNOaElE?=
 =?utf-8?B?anNUdzUxR0pBTzVQWmNQbENXcGpQUE1vQ0srT21STWZteUxjWFRTQjBvazcv?=
 =?utf-8?B?dzZGSEg4N1BSYXV0WDBSdkRpL0NVRzVwd1A5MGJQOXVDeTJ5T0RFWEpaWFFp?=
 =?utf-8?B?d09WbUs3L3Mxd2o1OUs2S2FQTythc252N3V0eURkL0NQWmRKcVd4dGc2QVh2?=
 =?utf-8?B?ZTFoUmIxWCtwaHVPNVZrRWRjRm9HT3E3bGJOSjNnbkNjYk1UazdMZ2VuNWk1?=
 =?utf-8?B?LzlaS2lOME8vNEdzQkZaUFpWaWpQd01MTGlWbzdmUG8vNUF3VUVENDl6UHNh?=
 =?utf-8?B?U2ZXYjI4ZCtoWm4xY09lRWFuVG9xWnhNT2c2a0dSMHpFQlBiRFc4MmVEcVl0?=
 =?utf-8?B?TTZZTG40MkdtR3NLRkk2OEpuM0RDK2ZtYmJsa2RER3NGV2lnaU5mMVdpTWk3?=
 =?utf-8?B?VHFyV3VTT2hVQ0RBd0NNWkZlOFQ1WVk3QVBxTndrMTE1QS95OFc2cVkzWEdo?=
 =?utf-8?B?S3FvS1hCT1dwR3V1dEtZMlNhYjRyMm5pOEFOL1VwQ2d4N3c3UGN0Q0FndWdu?=
 =?utf-8?B?M20rNFNDRWlOU0pjOUZLRk45bUI2UTdSa0pWR0ErUFdtcUxRcWtjdU92bDNm?=
 =?utf-8?B?M1hibTJHUkt5RG5peU5KM3lrd2FBSzFGZ0IwM1VQYmxialpjUEJXckZjN2l6?=
 =?utf-8?B?QnBURXlYSVEyTWF1MVN1Y3RDc2dBdE1VbklNbUFldzhQSVIxWGRwMTBESXMw?=
 =?utf-8?B?eGVwVnlqRDYwZzQ1WFVjNGlGQUZPQmJ6Mm5RZlA3ZlB1RUppQWJFcG5iZmNO?=
 =?utf-8?B?c0NWM2FhZmdNaU5abjZWOExpU1ZROTBUSXI1eVVDY2ZqbDdwdTdtRW42K1dj?=
 =?utf-8?B?cjQ2cmpPRlNxNlcweXl3YjAyclU1Zjc5cS9NVlJUcXMrTnRzRE1CbHBLazBW?=
 =?utf-8?B?Q0R1bE5mK0RUTTExTTRxKy8zRzhNRzFxaERDREhQNHhSdHlCSjNWRlkraEtH?=
 =?utf-8?B?b2pIUndUb05qTHpNZFYvbmRkQkJBUmIzVkZPRmxFNkJMcDQxVkl3cFh0ajc2?=
 =?utf-8?B?TlFVWTFJelpzUG56RVNjV281bGxGUVZnanowaXVBSHdPclI1NFkxOHFIV2Vm?=
 =?utf-8?B?YU5ZMG9pSS9JazBaWTVhM1hvV2hNa1dTUC9xMFlaRzF4Yms0bGtTN0RvYTA5?=
 =?utf-8?B?ZjlGanVZSTIvTzNlNUlyY1JaeEhoUGM4b0ZHa3kwTGtFVHRVM09CRDdSa1FB?=
 =?utf-8?B?am9tZkNUaG9KR3RsMWRnVDdvdnU1WG9kN3ZZenBpM2U4MUUzS1dTWkIyeGVq?=
 =?utf-8?Q?KSZo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dHFIZ1VxUnI0TzRmOXNZNnM1alJ3L3pJRmdHc2VjSlNPdEZGcFZMUzZKVHp4?=
 =?utf-8?B?SE5BcnFmT2RLWTFqZzY3OS9QaFg3aWRkd3NvV2ExWjFycDZyQ2J2bTJBY05q?=
 =?utf-8?B?N1pHOFdLQlJsam5mNHhMcm9TRTlKS0NweWo4WDlCTW5Idkh3ZUtqTVR2T0hl?=
 =?utf-8?B?bFZMdVFVaGg5MHVXMjFEUmh1REphWnZxRGZPQVFkeU5uaEdXUmI3TVgveDdo?=
 =?utf-8?B?Y3lpL1MvSFpKN1UreFI3d2RkN29TUE4vVURYNlVCV0lMczl0TVk3MGduWDQ5?=
 =?utf-8?B?M3F1V3FrZHNOUFBlRXJIMmNaT3puQVRVRXBJS3hPbHVDaXVWNlkzdnN1UTNl?=
 =?utf-8?B?dllVZTBKa1hpZWpTbzFwSWlGRHBwUjhJN1k4REtFMjZXc1R2aEJNTVBMRSs2?=
 =?utf-8?B?NHMwOUNJL2xKbytqeElaL2hqWjl2ZUdYWFdyc1h0Z1VDdzNIaFltSjhYSHM5?=
 =?utf-8?B?R3U0UDVNeXZUTGRsZ3E4T0VZcXhDL3F6cEZ6RmJ1eWVjQUR2NmxVZ1B4ZXNB?=
 =?utf-8?B?SS9nSDVhTTN4OGpKMmwzQ3RXV2cyU0QwMHFSQ2Q0QVkxT2hjL1FkWE5UQ2dE?=
 =?utf-8?B?anBHVzRUaTFWbm42K2dBZ3dwUFhSUFpBeUc2azZweUQ5ODU1ZE1mY05qZWUx?=
 =?utf-8?B?WWJvVUtEWEFXeHlNMDhDK3pma2VJMWZaeHJURkw3Y2N4RzB3SVlKN2ExK2tx?=
 =?utf-8?B?Q1RHZ3pQQjV2TUdDWTU3VVFaaFFoeGtjRm1LWkRmbnRIL2lDZlBwMm1YNzhv?=
 =?utf-8?B?ckhHNFVyMFFDcDlWT0VVMWEyamd1UUdNdmRUbnQ4U0lPSTBTOG9SZWNHMHNl?=
 =?utf-8?B?ajZ6SXdNYy83bW1CMlpuWUNlU0V5V1gwc3MwZHh0ZXZNOXZiVGkzSmRMVnBL?=
 =?utf-8?B?VUVMRVBsTmpUd0Q0ajJxa3NlR1JMN2JxNzBmb0Q2eENqejY5VHRqV2Z6M25U?=
 =?utf-8?B?aHYrRDd5QlNWbXkxNjRjMXQwa2tiM1VaL2VaNkZnTUN6SVFmNkJEZmpDOWxG?=
 =?utf-8?B?c2xnSlRHaC9mY1pGUW5HZzNpOGprbUdFSXJKK3J0STE1TWsvUDVJZ3VVeGVB?=
 =?utf-8?B?WXNiakc1R1RZSG9uN0xQUllpc0o3Mi9Pd3ZUdEpNWDdXWlZjSng1QjBRaWcy?=
 =?utf-8?B?NmEwblZPWUFTd2RuTlRtbmNQR3pCN25Fb0hrV2w2T1cydlkveDg3V0llY2ZI?=
 =?utf-8?B?aGJ6NmNPUVEybzRPdEROMEZYbFVhSTBaVnF0eFVTejVoVGozZUFnaUw3VFN0?=
 =?utf-8?B?VkYrMnNVd1Q5ME1aS3JRQU1hOHQ0NkRuMWhiT0xVY1RUL1FvUU9xS2lYT3Zn?=
 =?utf-8?B?VWtqV2lrcUl1cDhGSmN5RGlEV1JGSFYvZE9ua2c3M1pUTUUyU1NrV1dBYkk4?=
 =?utf-8?B?QnQrMEg2K1FMY0JZQVM1cUxXU2VLTklsclpsaHlVQWMxZWE0R1VHcll0ZVhL?=
 =?utf-8?B?RlpZd0tqTEUxOVRTeVJrSFp1Z09Id3lzdWlmMlMwQUl0NnRuZFF4dmEvVlZa?=
 =?utf-8?B?eGFTeld4bEgwbGxHdVFYTmVMVHZEK1JGRmJuT3I0VldSelI3aHk2bjYwdVlu?=
 =?utf-8?B?MlVyVjF4czBXUlBKMmtxV0N3SXNoQmdMckc2cGM2cFJtZUMrVjIyd3FOUEtU?=
 =?utf-8?B?RU9Uc2MrVERleWdXalA4UStjbHl6U2haWjgxR0lwUDh4M1lyN1hqT2VNQTlm?=
 =?utf-8?B?dXJscVUyTFdUckRnZ0xkUTVvWHVtZnp0S25tTUlSY2c4ck1sRnZWbVZrcDMr?=
 =?utf-8?B?QjRXdm1uUnVNT2daZ0xKRTNPRGdSTFFnblQ2YVEraHMzSmh0b3NpeWlvU0Mv?=
 =?utf-8?B?TnJDZTRrcE5nVVN2QWFFdWUzVzBQTkZyd3FjQmNtcWhzQ1JLWkNLRHpLKzhP?=
 =?utf-8?B?TTBwMXFpelJ1OGJpcmROQllkc3dHQTdjUmVFa3Z6U0VWRjhHVFNONllEdmQ4?=
 =?utf-8?B?S0lnMEdsdVg3cXplRjdVdW1kYWpBNjBSN0NYL2cva01abDg5TlpOYnRadzQ3?=
 =?utf-8?B?L1NCd0xUYWVmUncrOUs0K1hQejduc2RPOGI3a3hqbWIxU2sxeFVSL0tuUkVy?=
 =?utf-8?B?WnZVdXJpdk9Va2tGRjNLSnZTb3E1VzJKVzRHb0llaTB2TDJaUEw5WHlLdFBN?=
 =?utf-8?B?Y1J3K1dSVWVhazk3Y0xROUE3ZXZFNVJNZkhXT0xhOXIzL2lmM3QyRzJic2U1?=
 =?utf-8?B?cTdCdkZybGg0ckM2TDgvZzRaZ1JJbDhBcnVVa29hZTE3RW9aNUh5V2tsMUxh?=
 =?utf-8?B?Z0lHdVNZa2Z0Y3Aza3BwcllmMllTQVd3WlQrbWhpa3YvVk1zNzBoRC84ZGQ4?=
 =?utf-8?B?MWJHcjE3S3U3OVVQSm1iWm1qdWZndEFDWkJscjNTS3Zpa0t6Tnk0UzNQOUNT?=
 =?utf-8?Q?tjXrz1Yc+eyKzJ9ekkMbWI8ia44xb4Ade6dpl?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d53f8727-aed9-4e79-98fa-08de6d4ef416
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 11:31:40.4566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OlMr8/RW7Brx9Eq2SK7PnKGUGgLSD8+Ins38x7W6Fhp86akDsrTLjM4YT8+1NnNpxefY9VVM9b8+k3wHcjf/QJvSoRE5BysXpKY7oGZ5p8g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12354
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 16 Feb 2026 11:31:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8928

Hi Michael,

On 2/16/26 12:15 PM, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> 
> In the chapter describing the "uboot-sign" class
> 

This move was done in commit ad29e08b79fd ("doc: Bring in FIT signature 
files") available in v2023.07.

docs.u-boot.org is the official place for the U-Boot docs (but nothing 
else on u-boot.org is official, the domain name isn't owned by the project).

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

