Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33218CCF9FA
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 11:12:57 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.70])
 by mx.groups.io with SMTP id smtpd.web11.13024.1761909166632044155
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Oct 2025 04:12:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=jJasdghD;
 spf=pass (domain: cherry.de, ip: 52.101.84.70, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mS0062lZM9AiFMWRJGKdYgy6yX/3bQcHEpjGotHVHiySdVf6z3u8+NzmOI0pXCPzveIYGQKxGn+QS+XQ5dUeO6O4w6NQyOkbsZ/XbnBLDBRuuuswulnYEdQtPvmrmouKif+R8KJ4k+xReTZvdojPg/SLwBxUbbRkAlJi5N0vMoTcnJkKDDq/tH4iEsnoliFAnGt5NA1CZGOTa3w4+Q8F7UrkCG/AEHVUg5OxxHhDVwcmFpDofPHnRr+CM8HTIYq/zXxbpNmxJ9OgfPIshyOgRkKF5tCLL0xirbwqv1KkZjt7wMV1J+mmCT88pFzMuTVGknFR/rqdwJBcNd+HeyyMGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mp+FRfDHRU7vb+4YE8AN0mMowj4ttF94hC1CueQZcpY=;
 b=mOXrD6Q9qmscTI4PR9ElUcwnVbP6PD2aQFcTCBZqEMzqW5SePQAhk13ofZ15PxGIkN+ryVWFJbLvPHO15ZzYw0I/wtUToeHGSTvJRVY0NjmqdEaAtjKE+j8IUHC7j8qY+FKjw0UKgNjGUglfPcvErJDomkmvptwkbO2qNeuhA/V3VG+vkUfXr/c3ZPdwyQoBCiFZY0Yfzxa23qNGKYg8an/xmX3b9WTpDiiUCsu+7sFD/kiTSS/eIB7iEz9P9MmH/K4y9yi+7Eq1YOWNqTdSdO5IB7Leds3BCKinuUd+FvBSiE6T/FQR3Toey12H1o/xATw9r6ImBk5CVV4bdVworg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mp+FRfDHRU7vb+4YE8AN0mMowj4ttF94hC1CueQZcpY=;
 b=jJasdghD0l04fqxtIRRbZ2UgDhH1Nb9C4yVonVLE8pJ7ZcsdorHgi62ijygpAiIPhwuE3VWkWRTX2RoFCCdS17IQLLp0UezryWj8YGLm5EFXA3fzo26WHCWLK4pGVCIAnWcHJlWnvj++CAbYyuQqh0FiFWvqKKjH8QVFS8hPpQM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM7PR04MB7048.eurprd04.prod.outlook.com (2603:10a6:20b:11a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Fri, 31 Oct
 2025 11:12:43 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9253.017; Fri, 31 Oct 2025
 11:12:43 +0000
Message-ID: <29945dcb-cb44-4754-bd6f-02ee46cb4b90@cherry.de>
Date: Fri, 31 Oct 2025 12:12:42 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] why would you even use "FILESEXTRAPATHS:append ..."?
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <84dd014b-1c65-412a-ab7b-222add07fb63@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <84dd014b-1c65-412a-ab7b-222add07fb63@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0334.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::10) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM7PR04MB7048:EE_
X-MS-Office365-Filtering-Correlation-Id: b7c6c845-f1de-4b4f-dbb9-08de186e697b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Ylo0RnBDeGdtZEhxZDN4SXZmNTV5WVc0VTM4VDNVaUtraUVtQTZXMVV3eDFx?=
 =?utf-8?B?cUZKWDh1Y3BrMnBpYTZxcFVLOGM3ajMyVk1DM3loa0VhVitTSHBVcTViSEZq?=
 =?utf-8?B?dWV0cGlqYzhaSFE1UW5RVUZZZmxSbmRVTlR2Qk1XbDFZaEFrYW9QMGxZWXlV?=
 =?utf-8?B?VnZOWWp3Lytrd1Ird1ZXVmt5TzJBWXN5TDJxMjY4alJUVTBZQVZvQldiV2Ny?=
 =?utf-8?B?WmF5V0NWQ2tyRm1aYVlrOTdEVFUzTytEU3NuWkROcHhzNE9MZWJtVEsvMUVm?=
 =?utf-8?B?bEVGeFBNK242OVIrM2dWdE1mbWF3cTFCMVNEQVNWcWZHQTBzUis2YmU2WnBM?=
 =?utf-8?B?enl2Y3MvQ2FSa0Jab0ZOSC9WMkxPTEpPVGVuSGZITi9uT1p6R1Q3emtKR1Ew?=
 =?utf-8?B?aDVTZFhDR1lsaVlJeVc2Tm5XN3V3YmpHZ0dpd0VuTXgrOEYreXNKMi9VUjRX?=
 =?utf-8?B?SHlpZDQxRWRMNFYvRlVDN0NYVzYwK1dxdnZDVkZCQzlqVzh1czBxdGF2M0ZI?=
 =?utf-8?B?cE9BZjFXNFdWYkNJbkFGTVlLSDBpRHFJYmVpRmxMMDFqVG1uTHc4M2Nta2tR?=
 =?utf-8?B?MDlZTkpyakNUdmJ2cmJ6czhmNjFXNFcybEMrbU9LYnFCS0tUeVV0WVdrR3Nq?=
 =?utf-8?B?TlZ2V1VuTml3UVRXcHFxdUowcFpjQUd1cnpVL2lBT0VFMmJwYXYwUlJFVWZv?=
 =?utf-8?B?ak5tNFUyeGRPQ3VDNzNwRk92UmVqVGdqMER1Y0xHSUNPd2VTejQxcVVYdnpu?=
 =?utf-8?B?ZHExZDlTWlJPczJUWmF1aWNMczhleTh5ZDJzM0k0aVVqT2UrdHNOMzZTU0N1?=
 =?utf-8?B?UytyUWpxcXBkSWxQZkpscGhXTkYwTFpMd09iaXk4Q2E2M0YxdXhpeDlqWmVk?=
 =?utf-8?B?QTJtdk1HU21sdE1STkhpYk1sMXA5djhqRTM5LzEvQjFCTW9zdUJoeWFHSEEx?=
 =?utf-8?B?WVZrUSt3RjdJZlFkUC8vTEhXZ0dNZzJqTXJZampsS3RzSFVkTnhtRlk0SmVo?=
 =?utf-8?B?RytXMU4yVHJiUnlMMVEvdG0vQm5rRGhrZnN6aWhUSkxDKzlITUYySVB1Z3BQ?=
 =?utf-8?B?WGZjdnc1KzNSUVNKT0VvdU1QaHF5M01XNUxGTlFpcDVUSE5NMVF6cTB2REYz?=
 =?utf-8?B?QzRhWFNhdXNtd0gzRVI2YUd1WVZlNlBrdW0vUUpmb0JIdjB0b2FSTk4ycjFG?=
 =?utf-8?B?RkF4c2RJbkdrQWd2V0RVUkNWRXBIRS92RnFkNDlNcmZyTmV4OGtORGJSZzcx?=
 =?utf-8?B?UW1zRzdodFF1RTF1VlNlc2pmU2Nwc20rek42U0NGb2VYRWx1Wjl6S2RaUjl6?=
 =?utf-8?B?bUtWYlZHbkZ2eEVhOS9EU1dSUktYOVhKaVRLcUtmM2x2TDcydm1RV0x4MVEr?=
 =?utf-8?B?RDNHREtxNi94c1paUnNOWE55UXRqMUttUHBrYUk4anFPeUFvdkFQVW9FdkZz?=
 =?utf-8?B?K2d2cWpCRkpaUjZrRmVUNFJZeTB4cy95U1NLWi92RmVYRmF6OEEvVVRSYnZ1?=
 =?utf-8?B?aVptVU1mamFyNzlhOVhXSTRCbTNYR0JSWmh2aytJbk9rT3ZKLzJFSWozelZE?=
 =?utf-8?B?THNhcWJpRkdZNlMxblZNR0tNNmhrR3VKSEQzbFN0aVNCNXJUN2g5WFRpdlZY?=
 =?utf-8?B?NnJUK2trUjdwT3RxVmZNT09Yd1EyQ243dDJOakZ0aXRHUlNyV2dVdlpqaDNy?=
 =?utf-8?B?TEQ5RGZJUXY4VUtMYkllbUhieSthZnZHaEpuYkRYOVZNcnBMS1Avalp2NlpR?=
 =?utf-8?B?YnFJZGU0cDZqaGNOa0FYSUhKNXl5TkxTRTJPT05PeS8zYVBmQUZUeUtRbG95?=
 =?utf-8?B?TlNYclBnRDBaYlJKTW1SWVREMVZobGwvRkFFUFFvVWxWc2NVbTQwTTlQMWxh?=
 =?utf-8?B?NzZSNFp2L0FNdVVSUE5hakphLzhidFExcGtsSmRLd3lIR0p5Z1AzemZnTzdh?=
 =?utf-8?Q?SmyLPqanB/eXTWX+x0WBOMkmVRXPbwMG?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SHE2TG1sK2k2MGpwak5uajN5MC9FekRpeUQ1ZnRwYWVJNWlFUUMxdUk2S3Vh?=
 =?utf-8?B?Y0F0MmtJNFB3WDZtYUZZZXljVkM3cDEwcGorandBSS80cnNtcVUybTJHRlhS?=
 =?utf-8?B?S2xvOEZuQXJBU0d0MHpmZkNOenVhdC9PajRTM3lvb09vNEJpOXR0bTc0VzRR?=
 =?utf-8?B?K0Z2TUV5QkFHcEF6NjVlQktvZW5tdDBvalVGQ1ZiYU1XOUpoSldhQTQ4NHU1?=
 =?utf-8?B?Skh6UjZBeWRvY3pDSmxHQmRMVW5wSHhEWmlJT2xxVDJqWG4xLzl6cDlXcldk?=
 =?utf-8?B?WlFYenVBeTZCVFhJU29tQTJUS3dTZHppN1Y2UTcxNGFFeFdLMEJhZXdDa2RT?=
 =?utf-8?B?d0NpNHdrWkYwR2I3TzhTR0VTZzdOZ3g5TWczTlpBWXRWWExNY1poRDVrekV3?=
 =?utf-8?B?MWdTbVNORWtxS3hrcmRYaU0xRVlHSFRRK1czc0xTdzFiajdaRUJDdHZBOGFl?=
 =?utf-8?B?MFBMMm90SzBjbkxINUpXcWpjalh1bUlJaEJOY01neXdwakRhZnA5d2F2bklV?=
 =?utf-8?B?SzJzR3BCd1hvN0RhQ0lwZFNYL24zL0dKY1U4NERONElQQTVmYURtVFBBRXNY?=
 =?utf-8?B?RG5GRWJGY2IzbUpzc3JId0hzOFVybWppMFBVWCtMOEdlc2k2MDh3S1QxS1Yv?=
 =?utf-8?B?emMxeklhYWY1TG9IR1lBTEd2QjN6YjkzZHFOMTFwYlptb0E0NFlRMWV2V3Vw?=
 =?utf-8?B?V25jSXROakkrY3BGREFBMFFqN1FDOWdZNUw3M0M2N0NiZXp5RStiT1RzSnYy?=
 =?utf-8?B?U3k2Mjd6aFVIZjNodEE0NFJtNDdWa29TeFFBTjlUbURyclc0VHNLYlRaejNr?=
 =?utf-8?B?elk3c0NVWFk0Y0tvMzA1MExhRE84TVVPVkQ1dHVqa2xmcWlkdTdwWi9hMGRM?=
 =?utf-8?B?ZHAxUzhUeW8xQ1VnTzl3Y3ZnTlg4RzNSdktpQjNYUStaa0JCaWxCMVJvQmZK?=
 =?utf-8?B?d2JGMFRLVC9rSEFkNmpxSDhORUZwWGU1RDBrV0dLWk9yMDFOakQrbFdJYkE4?=
 =?utf-8?B?UllPL1JIK3JpdWxETzcyRmJOdVA5VjNPSUJVUWRUVS9QaXFQekowZ2xFS3la?=
 =?utf-8?B?SHd4Y0Q3elNGaERDYlZKYisvc1NkWFdWUjdlUlVyRWlXOFFRNFJnUXFuOG5i?=
 =?utf-8?B?cmFYQ29DRk9vc0NRbEk2TnVpK2YrRDh5a1FZRVZ6cUI5YStZQWx3dE8xclhF?=
 =?utf-8?B?c3QwWll3R0VjV0lzNzlNUG5FM0ZLS3c2bDZVand1b3lPMHV2K3d1a2xBcVZ5?=
 =?utf-8?B?K1diQmIvbWhVUVNDZjVyZTNUcEVhZmxOMzFub0NSQUx1aUxJU1U0dkVIV0do?=
 =?utf-8?B?WTlVRWU0anV4N2h6ZFpaNkFjNllOSEFMZ0NhakJMZjErb0w4amtiZXhCemNx?=
 =?utf-8?B?eFJNOCtoanZndzZJY3hCL3hkMi9oYlI4UXlwRnNnTHVJbFdMWVllOXQzUUdX?=
 =?utf-8?B?a0RYOEFoS0JWM1VvZXJzdVFibEZQN1FSMkVhR2FxamZwMXcxZGU2N1k1RURM?=
 =?utf-8?B?SXpMVlRoakMzZi9mdWZPZGNLbFBGVVBDRkxsZU9zUTRnd3JqM2N3YzhOL1F0?=
 =?utf-8?B?YjJzV3JENVpVZVcyYzV0YzFtRUgrdDVCTS9hTnVvRUZEeWZzRFFtaWtQYUs2?=
 =?utf-8?B?V1o0T3lBL2QzNmZ4L2ZWRUdMWENNWDRTYkwxYUJMTXRZZUY2TldxS21NUWUr?=
 =?utf-8?B?TVhRWHIyVzM2YUxRZHRNcmlCOHBZcitKWksvU3B3Mytvc2lOU2lxc3pWOENr?=
 =?utf-8?B?ejlpWUwzdHdoSWVZMTYxQ0pQaGZuTkpLd1JsNm5lOHJ3S0FIdVNIRjJwUDdF?=
 =?utf-8?B?ZUE1RkN3YUlPdDRESldVRGZ3a01uQjlwdGVGWXZkTE52YzFvWWNvMDVCQTR2?=
 =?utf-8?B?bmJpb1VVSEZDS2cwK0JmcHhmQ1p1K1FKMlpuTlplU0dWYTN3d01EWk1kOXln?=
 =?utf-8?B?NE9PbXNNdTUzNCt6elJ5WDVpTHhTTTY5Z3NuVlh1OGtXT1cwclVPSkkrWjZh?=
 =?utf-8?B?b1NtRmpRanFrdk5HSjJIeXdaM1N1M2IyOVFZeHhxUk5tZ0dNY2ZYSU5TalVa?=
 =?utf-8?B?QkxiUWFjcjFLRGU0WUZXMHVJcVFsMEhzcFl0V2dxdHVHbkYvSHhQMUJKWXpE?=
 =?utf-8?B?R25KYzNZNXoxSnZRazFEZHdJNWpIOWx1Ymk4S2FPWHIvOUlVZExaWHE1bGY5?=
 =?utf-8?B?cVE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b7c6c845-f1de-4b4f-dbb9-08de186e697b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 11:12:43.0985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jC9o6CoF4DicyR6AKPG5edj+DMVYkzXlY449o2/JNyQIbxttsIYMzpuZmRbcYy3pfBwitGbMsRBtAQ9VPS87Vzj4/xczsygAB1025tAr9lI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7048
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Oct 2025 11:12:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7937

Hi Robert,

On 10/31/25 11:55 AM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
>    a followup to my earlier post pointing out improper usage with that
> feature ... i'm still unclear as to why one would *append* to
> FILESEXTRAPATHS. it seems like that might be something worth
> explaining when that section comes up.
> 

The only reason I can think of at the moment is for a smooth transition 
period.

E.g. I absolutely need a file to be in SRC_URI so I'll have my bbappend 
add its path to FILESEXTRAPATHS (so far nothing different from a typical 
setup).

But, I want to upstream this so I don't have to carry it forever. My 
patch eventually gets merged into e.g. OE-Core and it has the file in 
SRC_URI.

If I were to use :prepend in my bbappend, my file would always take 
precedence even if there are patches made to the file in OE-Core.

Instead, I could use an :append in which case whenever OE-Core has the 
file in SRC_URI, it'll use that one instead of the one from my bbappend.

Now I can forget about it because it won't be used the moment OE-Core 
has the patch merged.

This is actually quite useful if you have a layer that works with a 
release, say scarthgap. I patch in my layer until my patch gets merged 
into master and then backported to scarthgap, that may take a few months 
before a scarthgap release carries my patch. How do I make sure my layer 
is compatible with release 4 of scarthgap without the patch and release 
8 with my patch, but still benefit from changes to the same file in e.g. 
release 15 of scarthgap?

I think there could be a usecase for a bbappend for multiple versions of 
the same recipe but I cannot articulate it now, so maybe that is just 
something my mind is trying to make up.

In short, I think it's more often a mistake than something intended. We 
have had the same kind of issue with the wrong operator (or line order) 
used with MACHINEOVERRIDES where its order got all messed up (admittedly 
years ago :) ).

Cheers,
Quentin

