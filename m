Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68F55C56208
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 12:42:25 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.61])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18853.1786020133943842754
 for <docs@lists.yoctoproject.org>;
 Thu, 06 Aug 2026 05:42:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=YYh/qLb0;
 spf=pass (domain: cherry.de, ip: 52.101.66.61, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=daCgwS3vxnj6CoLpQLn1gEC6hHhI+ZCgBEDR3wK5F6Pum9/YLA7fvir39pd24RtV9KfW6oHpMwW2iofvxfb/zHQWnCgmMlx9b1sQgxqbhzksV1V6JwWjoEp1nXIlmzx/EHKEbWFXuzzJ3SqNAY4vUNc3AFQKkmrfDImceju0VeuRPXuRFIb7hrr+NbZqceXlAZdLUc1826pZWHaZPyylYmm84bz+lGUkEj02V+thFvu4lsV7b8VUhEemnidGOHDSSCBUSffvucdfYIfAkCcezwuvxMH0nI1Uf/MB2NB+kfPOe/WMnYtCrjY6QkpIR+XYsSze3o/TvmjyI5ktc0dGGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U1k1Y3R12r4kir4FhuBmRGorv0ie6C29/BQIrvLrFvI=;
 b=vu+KWhHApz/hpHimJwOvwfu6Di4bMr6eIWIftP3fO/nhPCpLpVL8ql/x0zZOBf12dH7iDvqIwwXdQL2PU4o+GoRZTWgaiTd1J99MRsgT/h6qKEPM4doi620//RmA8XayX1xD35VHtMrxL+U6vDwo1riwcw6PI3EaL4LKBZslLbDtLBxWwccc3+LFlFi/QzVVDIyO3tRfa/3DZn7JXPZqZ27uwOT76pPjovjXGGll715Z8WfO6IkKbSnfw4Jelb1RgYkmtnZk5fhvhj7o2B1HqD4yU4RmOWeJZ4r5INcqtLYHT10rOGkFnv6QiWXrzmsfRndLlBlZiwZhQYyhtsN33w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U1k1Y3R12r4kir4FhuBmRGorv0ie6C29/BQIrvLrFvI=;
 b=YYh/qLb0kCMjVMi5awxdwJWkdAnEPVE9LP3O/jELHLVShnRmkIDsWxaCCKiYgNNk25HsopQIPneZQ2Qjyv3DGP0v5dLtPxCykGUnBNCpld7TV1JC1NESNjDh27Y8pVftpj6KNNoyQ1bbYKLFOPn30EscvgjOtlhjKYv5h0bZnow=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB7733.eurprd04.prod.outlook.com (2603:10a6:20b:288::18)
 by FRRPR04MB12571.eurprd04.prod.outlook.com (2603:10a6:d10:1cf::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Thu, 6 Aug
 2026 12:42:12 +0000
Received: from AS8PR04MB7733.eurprd04.prod.outlook.com
 ([fe80::8f86:fafb:dce7:bcd5]) by AS8PR04MB7733.eurprd04.prod.outlook.com
 ([fe80::8f86:fafb:dce7:bcd5%3]) with mapi id 15.21.0292.018; Thu, 6 Aug 2026
 12:42:12 +0000
Message-ID: <f5bbb41a-bc9a-4797-8e8a-985f76aa982c@cherry.de>
Date: Thu, 6 Aug 2026 10:48:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 5/5] sdk-manual/intro.rst: detail differences
 between standard and extensible sysroots
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260731-sdk-clarifications-v2-0-b34f797492b1@bootlin.com>
 <20260731-sdk-clarifications-v2-5-b34f797492b1@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260731-sdk-clarifications-v2-5-b34f797492b1@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0063.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2ca::18) To AS8PR04MB7733.eurprd04.prod.outlook.com
 (2603:10a6:20b:288::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB7733:EE_|FRRPR04MB12571:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a57746f-fecf-4699-25c2-08def3b82325
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|10070799003|376014|366016|56012099006|11063799006|10067099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Cf3tLQxHytZ9S7B/4XHNse/brMTKiU6Ai51+fGAX3AMKOQf7XEXgNUT3cMNnCoD4w5JGFCInSDQ26AWPmPYK+oJZhXXcavHPqh6R9WRJamFl9f+g6CYgD/VFZLRAS50AplYROPRn35orKSaHhzdN9TTcbmG87+aebV7PWlqUOqi/MGxhZDtQf1LxT5+WuGQ5nj6mamTQTIrCy02Vvii/p3Gwc6GNgSaTLh6FQw2w/zRQR17/gd2ttAY2CXa9dJs2Ap68REia0XN5ATfxZ5smevmdKdIgq/M+tCMXjggouwcauhvCtEzNBuzEyjA1MA3bxwa1IcUVOSsqyI993+S6OyK1HNh1hjORRLSLWUFSR+kY69Y4suLx+Yg/XEBR6xazH3WffvAdAt0LKAyJsJPQ9mYNOg6VBEFZ1IwiZ2VI4ksaCLJhmeORu/R26HTSyWoj1CgnEdniy8BYaLbGwtVkTFkLiTfaN2qyhmU9ude1+tCyAmayOuBHg6jMeJan5ALwrvLHfmzBqWK0HU1/IybB6nJ4mSMFtAK6vE7YmmcYH/1PcrySC6nveTFqLVvZgh6hRlWzuoC5DlybO7vFN6NkixnYBsvjfKm2vAI9+ew8AHCFaHxq/N9ls+RyLyOg55NeGAMyVM2ERJ30MYFb9hCntfA2/u6A5vlQrErevaDgCSI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB7733.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(10070799003)(376014)(366016)(56012099006)(11063799006)(10067099003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RG9wOExEOFFWVDJHNVNEek01VzI4WHhNZ1VjaVNWekg4amFmUnFER0x1N2Fw?=
 =?utf-8?B?bHpBdUNhK0hoaFBVV3dGUGZKbGpGeER5VlRIQ1hyeHFoc3pzMklTZlNVelpw?=
 =?utf-8?B?eW01QVljWVZ2NjBISkwxZkpONytjRGhsamJZYmlHalBtU3dxSHIyYi9BRDRw?=
 =?utf-8?B?K29lNTQ3L3VwWVQweGFPcFByYStJSXI0VDdVbEM4VS9jTXc5RzZHQTNsTTZj?=
 =?utf-8?B?Tm51aUY4bGN1TlBtbExaUXRiZEZWM1NVb0xGcldBeEZ2aWFzb293RkprSm5C?=
 =?utf-8?B?TEthK3FUVkh1bUUxZk5UWFVoQXRvaVQwVlVSV0JrZER1L04yOXlxYkVJSU95?=
 =?utf-8?B?RzNIYWt4K1NqRXk5dTRFalBiTFRRNyszT2ZkOWtQMkxvZE5pZTBvUXNPZ3ZK?=
 =?utf-8?B?TVB1SnE3bzRTSXpFNU4xYmcrd2JGQVRWbXZqcTBkclNKaUo0SlVBa1N1SHpw?=
 =?utf-8?B?MXZkTXA2V2xRMENYdGVRYi9mUnc3SnUza0F0c3cvVFBqOFNhRmtUc2FhVm02?=
 =?utf-8?B?bHNXaXNzTWhWbVN4ODZENEdrQmdMNWZySnY0R1MycGJRbEkrUWNYWkh3SXh2?=
 =?utf-8?B?bzBvWXhHeE9DamZpWVhCaGl5bTN4MnR4VDdFUGZISENjUFFWZmQ2UDJvendT?=
 =?utf-8?B?WWt3TjV3a0ZGeGpmMHJYdXFncmUvSVF3a2owMDRvSTViZlRoRC9rZ1BUSlY5?=
 =?utf-8?B?bUU5dVBydDRiajRHRS9rRjdxRVE3Ky9xNTA4d2MvK1kydzBJcWtJeTAxakpu?=
 =?utf-8?B?RExTRVRIZXpTSmpudHFrMkQ5ZnIwMUJCQUs4aGUrckg3UE44eWwzemFkMGcy?=
 =?utf-8?B?L1FiQjQzOWFZdFpSc1NFOWtiYngrakhEQzRJZ1JvK3hmSjVESmxFckxBSFdM?=
 =?utf-8?B?UElldGFZd0JiNGhKZVpxWVBLZ1dYVEU1UkRpWXNBbER6aEZ4SkFEYlJoV3Qx?=
 =?utf-8?B?bTJyUmVIMlhJL2R1Ym93Z09wSEZ1N01wdE8vY3RYSUdlYm9yQXZURVRUa2VQ?=
 =?utf-8?B?amMwYmdzVFAwdC9wczJrNGpHMmxxT0dFRGR2OTlKNVRDbElXanN2V2RaNGdj?=
 =?utf-8?B?RnhkSGQvc0k1VmJXbS9IbTd0M3lBSUdPZUhsOGZhK0NwZzI3NC9sSEdMNDBC?=
 =?utf-8?B?WWpTUXdsc1BHVUtHNk50cXdlTXhlMm5KNGNZclJpaTlJTGNTZEovVGFOWnFX?=
 =?utf-8?B?c0Q2VnhQWUhEZmFVSTFJUWVoempJYU1BUGx6RXRRNlgvUWZaRzZ5RGwrcUF1?=
 =?utf-8?B?NTd1TWZ5MFU0azRidFQ4Wk96WXIyUXNOQXo4T21TaENTR1Q5NVg0NzBvV3FX?=
 =?utf-8?B?SXF0S0NydFhWN3p2ZWs2OG94YW5pKzJPRCs3RmpxeE1xb2lCTmYxT0ZHOHNz?=
 =?utf-8?B?anNhZ0NUR1o4U1MzNmhnb2FPQ1lXUVNQcHp0c01GNGgwTkJoNktCSVc4Q3Fk?=
 =?utf-8?B?Q0haay9mZ0ViUE9TZ0hjKzdNdittdy9ISm90MW1pRzI5dUF5VEFaNkE4QWh5?=
 =?utf-8?B?ZHlXV1VOeWovczVsS1ZyM2EwOUVWV2cyc0pEZ3M2bnlqNVNLTVVvaHFCc3Nt?=
 =?utf-8?B?ZjJIR1ZzYWRhWTRwaG43MFJQcnczNVVEa05FR3ordEFMQlRpRysrUmNQTlBY?=
 =?utf-8?B?T1NScEJIUDBoWUlkQjh1ZmZnRW5TRDJZVUU3SWwweWhDb1ZTUHlyNDIvc2My?=
 =?utf-8?B?bXo0TnpoZEc5Nm8zZDBKT2Q1ajdKajBTbFJlRUhQeHh2d3Z1VXdnS0RCNFZ5?=
 =?utf-8?B?M3pJN01HMjQxcUNxNkQ2em9lUFdRMWxpaGIwTGdTN1ZXaC96RVFvcUdjQ1Zx?=
 =?utf-8?B?U0xySEtBZ1hlc1BCQTM3dnhJZzVyOUtpMXNQTnROOWhqbXBxSzQwNkdMREtG?=
 =?utf-8?B?b0FUNEdBZzVZNkdFRDc4b3dzTWplWGFIbmhacEd0ZWRIZ0JZK0lDMHdPaFJU?=
 =?utf-8?B?dzhlSzJIQ0dPamtad0xLeTZRK25rTTk3Y3VvdzFyU1lpYkEwbnJuTU1ZV0pX?=
 =?utf-8?B?TmM3QnVSK0s4dHRvNkMyQTVISmN4R0ZTSXFRT0VyN29ZVDRCMzVWWGt4TW8r?=
 =?utf-8?B?d0NwemRneENiQUZhWnlSMUd6RGZVUE1ac3Iza1dlTWlmcGlZeHIrQmdGUTVq?=
 =?utf-8?B?dDgwV2hXeUJBQmtaZXdsOWx6dVR1bkNYbm8zU0ZSdTBoNFhEU1Q2cHdNMTFv?=
 =?utf-8?B?SjhtSGlIa3dUSVZhYTJMOTgzUmNkYnlvVzhJQ0NvN2dwRjYwOWEreUJOU2xQ?=
 =?utf-8?B?QWxTYmtDTWVuSVIxN0FjYnRKNWtWM0wxSHRWbDlEeUp4MGUvZTJnRTlTSFRo?=
 =?utf-8?B?TmVLOU53V0NUKzNHbVVEbmFBV1Byam00Q2d4Lzd6RUIxUGVGcWU0MmNsb0FD?=
 =?utf-8?Q?F9Nl9nNNehr3kk9m/A+fFYZP4Rx9HalYqz9akKY3QcjNj?=
X-MS-Exchange-AntiSpam-MessageData-1: oELkakmHXxsoCk8WHhCh5xVf7Q8OeJAV5yY=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a57746f-fecf-4699-25c2-08def3b82325
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB7733.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 12:42:12.3229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: en4i1V/uHwaPfWCihbOJZKzAwK4qbagrahvW+I69m9LMnfnjQH0OKPnjaGC1mUTlIey22klKXwb20KLUHcb0CEHSDGoZPaFQrDUIRmIG1GU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRRPR04MB12571
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 06 Aug 2026 12:42:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10240

Hi Antonin,

On 7/31/26 11:19 AM, Antonin Godard via lists.yoctoproject.org wrote:
> The sysroot in the standard and the extensible SDKs are managed
> differently. Detail this in the Sysroots section.
> 
> [YOCTO #14830]
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

