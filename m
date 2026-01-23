Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 634ABD74EE4
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 15:18:39 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.404.1769181509964688404
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Jan 2026 07:18:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Ok5xcghK;
 spf=pass (domain: cherry.de, ip: 52.101.69.56, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ulWW50evXKCUrgerfm2QRGZ5NpGDuca5EEqe/SC+XFs74tr5IWHPynN17REPLl4EvVN34DvvbYzvgCvJ6xbUQYDYJKt2Tvz40ceVxGonqNtwkw2QEsQEMooybdgGWpmPwLXHH2+2wTKVaSX/SzrGlkWUvG4lPANb8Qb+negDJ+e+RiZ+nlcyfR2zoG/8TBJthgm0ZRPuIma/8zFAu2Uiv2JS8GOy3VgRva89OUamIIHzbfDD0So3Jzw8regBpHFMe4Gh8lOn3P6LDnrJTT+czr9XZSfYJwwiv/L28Vk4RdstIznXyTYMD31kktxjgSP3GjA0QNTNEfaTLDMQhLkTHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=alGuiFe1yXzpvkj6/kRLV0QGRdB4NFxfXWtaqNJoRd4=;
 b=pULLd30S30gOo3T9+riA5OO0jdOrTftNvv+ainQNaEjurWZcY7xaX8x5frPMcPYDlXAEj8g9P+eekKQLqSATMn+EhMbgpnQzfR8zgKeNb7mI2vB5cOKnvG58GFMmAQnb9m7SMJzfFFPB+ycl1gHjaRLRqBAPYvz5AoRgFchZ+KcYhshIgZukHv37jRS5Wp3TL/Skgzp+etQmVP/J9rVrnIpva3vQY0rl7X1ZVQ3zNmYFA0HmFe2GIEgiuzsRgWtqrHw1vrsEFliX7BCgdmJ8IUy+9WVKgowS9XA6RNcMe8jA6+HrxG7VwTclPrXdaHfJuvaPBEdwrH85C4QNKo2vMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=alGuiFe1yXzpvkj6/kRLV0QGRdB4NFxfXWtaqNJoRd4=;
 b=Ok5xcghK4MPVNDhFvACXmhhOql2kvQWNCyhQD0nkW9Ob0gLoI0D/uJN/P9BXeIFwoVX25n8b9/1vIBGbePuAhBHwDKVkQ7rkjJzN7weX7a7rVqUKvdNoJcfsb1cAKxdr/9oODxczIl4zeIRrDbtaQ0YqiJ1FQHPAXaqFd7JLMLM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by GV1PR04MB10080.eurprd04.prod.outlook.com (2603:10a6:150:1a0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 15:18:24 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9542.008; Fri, 23 Jan 2026
 15:18:22 +0000
Message-ID: <16be4d18-1e62-4c8b-818a-86b33f52d5d3@cherry.de>
Date: Fri, 23 Jan 2026 16:18:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v3 3/5] ref-manual/terms.rst: simplify the Source
 Directory definition
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260123-terms-refresh-v3-0-41c35f0a6a13@bootlin.com>
 <20260123-terms-refresh-v3-3-41c35f0a6a13@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260123-terms-refresh-v3-3-41c35f0a6a13@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: JN3P275CA0132.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:d0::17)
 To GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|GV1PR04MB10080:EE_
X-MS-Office365-Filtering-Correlation-Id: 29abadcd-8696-4bab-7a7b-08de5a92a5bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?STQ5dGI3VVY1aHN1aXVpSkhlZXQ2Q0VNdTNFQ3dPc1hyWjFxWk1OeHpJMGI2?=
 =?utf-8?B?MFU3MFBvK1NHSExJNmZkL29ZemRZeXdZNVU3N21rVGxQOHdhMyt6OWVxMXlK?=
 =?utf-8?B?dXZPanVVNC8wMFBYQ3llRzhPaDVieitDaXN5T3ZTWkVlV1V5MmRqQVZrU1RE?=
 =?utf-8?B?N25Bd0RJbzFxVnlGWkxsdWZVS1k3akFGajhVRUFzTjR2bFlWRTQzcCswYVRw?=
 =?utf-8?B?bGIyRVJBNjlXKzJ5elR6eFBJUWNOLzBJTkpyR1plMFQ4WE94SHliZWJDMTFy?=
 =?utf-8?B?NEZrdHV0UzZMSDNnNDYxeFo1S0dRakdUUkdZbVNOZVJmTUx4UGJiZStkZHJ4?=
 =?utf-8?B?S3ZoS3hKOUN0b3lkdFBqVERnOGNOQXVDTU01ZTlCQ3lkTUw2UGFBVk1VMDhv?=
 =?utf-8?B?MlQ2V3AwRG5RbHIwcEQvdDliMjRvOUpibGwvVHdPalJ2N2k5MVpwaXpFTGFF?=
 =?utf-8?B?YldPb2pNenRGUmVndUtodHlVSHlESnFMMk4vUUZ0Z3hKMnlMKzJzbUFlVk0v?=
 =?utf-8?B?bUNGQ01BTnZHNWI0SGNiZUdYSDRSSHExZUxtak5xaTFqZE5KQ0NQMXIxb20y?=
 =?utf-8?B?c2tUcGsya1FWQ1ArYVJwZTA5Q2RCb0N0ejRSRWhDNGR2ZG9wbHlYcjhabFh2?=
 =?utf-8?B?MnJrV01hLzN1YUozdUFOTVJXS0U4WW8xNEJWR0hOSFQ5NkViRCtTSlcwNnkv?=
 =?utf-8?B?QXpFVFZuN1l5YWdNMVdGbUhSU0hHNm5LVmtzR2lTRmM2ajhnRS9WbXk0R2NK?=
 =?utf-8?B?eFJ5VjcycjhJY0F4U3cxRVRqbDQrNFkxZU9GUWJ1cUNoSEEvc2FjaUpzdUpP?=
 =?utf-8?B?UWpBYUxnMUgwT2RjVElPVUx1ZFBuem9BVUFqU2lUQ3huaVI3VTl5dVJaVVZp?=
 =?utf-8?B?cU9xdi9ZajEvR1Q3bnBTMXdkWGlkRko4RFRyYVRCSUFhRGQ0QVVEeWlBZ3ZS?=
 =?utf-8?B?c21vKy95d043NHZJa0s2K2Jxd1BhVlhqcWVhMVk4Yi92Wk5PMlQvVDJEM1p6?=
 =?utf-8?B?c2FJRW9xT1oyN2YzNHRieGIwRHRhVGgxREdud2hYU2hhdlRnK0ljTWNxSXNz?=
 =?utf-8?B?WFlUYjVZSFJkMDNLL2Y3MEJPOFh4SXlMRVIwQ1lLd0dKV0t1dXZkWFg1K0p3?=
 =?utf-8?B?YjZ6S2JtRUYwd0p2cFM5Z2hTZUcwQkFrVU1KcVVjUVNzc041ZTBWanNIb1JN?=
 =?utf-8?B?NGVzMmt2Q2tBRVdOMEZYWVVUemdyNmRza1piTVdrdytnaVJmbDlXdVZpa0Rh?=
 =?utf-8?B?MUpSL3ZIczAvSExQellqVVcwZ3g0MG5tR1ovajJrQThWOUh5dkdnOGk3YlFK?=
 =?utf-8?B?THZTa01naDhoVG5lRW9lcnZ0eVhTOWNybW1UMHdIL1NuN2JxcnA2Tk1GUHlo?=
 =?utf-8?B?WXBEQ2RaRVNwSzk2RHRlUnU4Z3VncEVIWTRXd1hQS3dDTmJWTUFMNkZLQXd2?=
 =?utf-8?B?ZFJWNzE2a01Ya0NneS80VkdPM1NKQjdNNmxKTzB4OTRxUVJzbXVKckp2L3c3?=
 =?utf-8?B?RHFwVEZHNllZK3FLRko5QVRMQ3FXYnUraVpCLzV1RjV6V29QcUt5QjVPaUlO?=
 =?utf-8?B?a3R1dWY2ZHdxWEVFQkV4QjV1d2E3UWRqQzFtUEJWNWl6aVFqb28zUWNBSFFX?=
 =?utf-8?B?R21RSzNpYmU2UXdBZTVlK2FiUHdxUnVzM0NmRm5ZaFN4Lzlxa09INXJveHJ4?=
 =?utf-8?B?Qjd2clVYVEFYQS8rVGYwQ2wwRDVYR2l4Vkl6MzBaL3htWndRaUMwUFRJQzAv?=
 =?utf-8?B?bGhiNHBtWkJwbEhKakpXcHpGeGF5Y2M5MlBqb2JpMytBNmpQSlZyQzNobURO?=
 =?utf-8?B?Z2dHVWd0cXhtYzdMMjNNa2g2ckd1bVIrSXhKQ1RqMFQwVkhpSmNaWUY0em0z?=
 =?utf-8?B?Y1ZaR3NCenhKN1d5eDUveTNuTWFrOG5nVlEyZm0vSFRxN1RicGhQb2ZwVkMz?=
 =?utf-8?B?V0N4eHZjenBhQitQK3B2M1NyUFFnOXR1UXVMOHkxdHdPMGF0dE5tQ3RQRkNz?=
 =?utf-8?B?eDVsd3I2c2FCT2Z0cG9ZZ3NEaXl2OGRIU0RacEJrYnA2djg4QjJ1SFVDTG1S?=
 =?utf-8?B?OEZrcWR1eDFWUTJMb2wyR3JycFJ4Zmg5OGJZK1Fvb0JJajBrQVNSMFZEUE0r?=
 =?utf-8?Q?7ROs=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TEhJUkJ4Ni9FbzRaQTczWkVXbXpQZHlPdUowR2FUNVhTMFpPc3hjeERYTDRB?=
 =?utf-8?B?TGU0YjhQWVZybHhreXJua1lQYWIxelRLVnN6SEFseUxrczBESDJKRzZodEl3?=
 =?utf-8?B?eHVkKzVGSjlrT0JsRTRkaFUvSU1BSS9jVDFUbC8xaVJYTW1CcHVvalJqVDNz?=
 =?utf-8?B?ZlNIaXk0Q0d2M2JvdGw0M01yMGNmQzg4dHpvc3M0WHB5L3JBNENkUTIzQVhl?=
 =?utf-8?B?dDd4bklYRnlxNlRJdzJ5eDZjUFpPQVJLY3hBdkpEVDJzdVhDMXVvNU1jckxo?=
 =?utf-8?B?UXFXTkhISkdjcFpCK0g3YlBrSHNwM014UXdPd3lJOGhzT25kQVF2N2syNDV5?=
 =?utf-8?B?WDZCVW1odnlpOEpNZ3RoTFF2R2todjZNTnBmOHRtWC8vRlpRblp3bDFVQzN5?=
 =?utf-8?B?QkZXT3R5ellPd2FOanFyRXl3dExIVXZYcUtUWWRVZ1FRZGpKT0Q4RWhtOGRV?=
 =?utf-8?B?TGR1WGV5YlIweGZpcTFwWSsrTUFLOHZpdStOTHZpZXlLd0ErNW8xYmlkb1lp?=
 =?utf-8?B?Nno3dmdPVk14cFUyVUU1UXFrTVZiTUlxUndyeXF3R052cnZTemxQVFQ5OUJJ?=
 =?utf-8?B?dXNWUnBYWlFxSW13MmRId1UvQis5SEFQMHVCVEF0SDAwUTJOY3BFOTdZWVhq?=
 =?utf-8?B?YVNWS25PczN6RWlGRHBUMXJBbkZzb1VoU0dmaTlxeTFRdXh2NUorQWVJbWxI?=
 =?utf-8?B?bEdlYkxrYUtsd2xkLzREODludUFMcDBUalVob0ZVTUphRnMreUkrRm9PZFND?=
 =?utf-8?B?NzNVcFhXb2s4Z3pZaFZWVlFaY3BGemNhSisrZStZRjY5QXBTSHplclJGajVx?=
 =?utf-8?B?cVU1MDBWaHR5N0h6eit2R0QrRW84ZFB2RmJCdWY3VWVSSHQvMnk1YVpOTFNL?=
 =?utf-8?B?dTV4cG1sT1BtTFNsOUx5Uk9Oc0RrQzFDMG82RURuc1hjcEljR015dzZ5MG5i?=
 =?utf-8?B?dXZJMlVuZ2R3K0hOSHRjUDZZZVRBMFRsVjVibmIwZk00MzJ3UUJvZ2Ruc2ND?=
 =?utf-8?B?UVA4TDRMRmV6YUxQemdwb2k0ZlZZL3JadkMwN2x2cjFYaS9uS1lPQkY1eTha?=
 =?utf-8?B?NHhvTXZjcGRtTUR5SEYyMnMycnRRYXlLdEFBR2R3WGZQelRqbk1xVTVVMXVx?=
 =?utf-8?B?OFpLb1hqZDRIaWNyazNrTUN2QXl4UlN4RHZGRUhNdTBOVXhJOFJNWG1PRnVV?=
 =?utf-8?B?UnpoR1lnczBlTFdiRVFDeDZRbEpZdWJwVkV4R3pISlpOY2J6cGxQTnVzZEpY?=
 =?utf-8?B?T3c3MHB0YWVpcXU4VzZtV2R3U3BpSzZ1OGFHaTR1NjZRMFJ1NkFDcTU0Z2tU?=
 =?utf-8?B?R25zVmhFZFdtRkJhaWdXcGp2N3JFRDFMT1FZVzYyZlJYVksvRytOTThScEhj?=
 =?utf-8?B?V0JsUEZFdm02TUlyejNkVFBrMFAzRHJWbExtN3o2Z2xjTXNuVjlncVhTYWlk?=
 =?utf-8?B?cTh5ZTl5dmhCUGpWN29TcEtwNFpDaExZaHcxdkpwR2RaeFBLQzJiUWQ3djNj?=
 =?utf-8?B?MEFxWmpWK0tTYkpCc3NyK0dndEZNdDNJUlBja0xUMFlETkc5a3NqS3Iyc2Jy?=
 =?utf-8?B?TXpGa3VmQTdwYjBnZndjNDhncjB0d0tBZkcxaEV4dEdyUG9IdVAxaUFDdUh2?=
 =?utf-8?B?Ti9Bd3kra2lxRmpvR0lhMktFaVZIVmJUL2x3S1RKYnBUMldpYzVRMGJCOHNW?=
 =?utf-8?B?NCtaZnNjWVYvY3hCS09yVUx6aTYxdGZhTjBuZUFmOGVLRUVpWndZTWdma0Ra?=
 =?utf-8?B?RmtGaUZBcm1Ta0VyWTNsVFNaV08yVGJxSkJmYTdBUDhKSFA0b1FrZ3ZmTnZt?=
 =?utf-8?B?YVBoTGM1c3hVZjh2RXRldjFUMnhLVFUvUXJOZjR1WlJCSHdQNmo2N2tmVlls?=
 =?utf-8?B?dUJNVGM0TklmZ2hvRUc0L0ZQOUtPYXkzUStBeWlSMzM0eW1zQVoyN3FmdUdF?=
 =?utf-8?B?UnNEOThzRU1USlU4RjZ1dm1ZZ0JMbXdYZFljbUVRUVJHTnRNWW0xK284KzFG?=
 =?utf-8?B?Y0JHdkZvaVh1amh5TS9RTE92V0cyamVaR3RCeWsxM2lKWXVTMGlXMS9jQ0hW?=
 =?utf-8?B?Z3ZUVzVUeldoMENvaVppUFRpR1RrZUwrWmxNdG8zeHh4QUE0Z2VWdlpva0k5?=
 =?utf-8?B?OEh1cmtoaTZORXRGQitCZHorMll0YkVUM3Z3V0MrNHhWaDJWNGg2R2E5enB6?=
 =?utf-8?B?eElJTGJvY0lJTWZuSGJwQm5OSXFSenljNXVmMnBIZEN5N3FtdHpVSVE0Z0ty?=
 =?utf-8?B?SElaVzZoZVIzcFhpZys2VjhlNGFoZldTc2pGT3hpTlk3dVAwOGZrM2xnTldU?=
 =?utf-8?B?S01FODZDdFJrOTZzR3BKaW1EbjVLcENnaUk3THUzbmUvckZ4bFNrandWd0V0?=
 =?utf-8?Q?Z2c20GSDnG4+F4myz9v2U3bGHAQi+VUPPUMQb?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 29abadcd-8696-4bab-7a7b-08de5a92a5bd
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 15:18:22.8281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CF7WYJBB8JUVWCZpJDrLypTTp20tOq1Zn6NMVNrittj5iLu/cjEih8yS/HifJ50LzxEFTSXb3RUB6vVCs44oQTH7+Td+mz453elAcORujrs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10080
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 Jan 2026 15:18:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8647

Hi Antonin,

On 1/23/26 3:58 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Now that we no longer have Poky around, simplify the Source Directory
> definition:
> 
> - Make references to existing documents that show how to create this
>    Source Directory.
> 
> - This directory contains sources, the layout in which they are
>    presented does not matter so much, as it can be different and/or
>    freeform depending on whether we use bitbake-setup or not.
> 
>    The definition chooses "project" as the name of the source directory

bitbake-builds

>    and is the one that should be used when showing examples in the
>    documentation.
> 
>    A typical Source Directory would look like the following:
> 
>    project/

Ditto.

[...]

> +     The Source Directory contains BitBake, OpenEmbedded-Core (OE-Core),

s/Source Directory/:term:`Source Directory`/
s/BitBake/:term:`BitBake`/
s/OpenEmbedded-Core (OE-Core)/:term:`OpenEmbedded-Core (OE-Core)`/


> +     and other files that all support the Yocto Project.
> +
> +     Consequently, you must have the Source Directory in place on your

s/Source Directory/:term:`Source Directory`/

With those changes,

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

