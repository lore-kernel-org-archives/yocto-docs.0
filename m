Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B0EBD2D8FE
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 11:15:39 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8728.1769512518193034180
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 03:15:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=c9u1tzPz;
 spf=pass (domain: cherry.de, ip: 52.101.69.43, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jzqV6d4T8XuP6xXDs8H9iVAPo11dh5cYPtBslmOaVq0vBkDZa+EDzHlWddOKPc65eEaKLT7XqdJN5jWFh3oeVFAnN6oTsKWW8nFlVN5yWseJZeS5vcurHt3MmuBLxHlKEUbuNsySM8jSFuDe9uDgGMFxEHb1aQ1Zf+AjbhcijsBlp6HZhKpnrSui4RQkiPUAUdy3kurBZA3FWQu5m3uu9H4wqOMVuuzP49/0BHH60LoUDb9aK5nOLnEFq2yuwmFU8RwmYVfJANKGFIElUwvzD+1lvJgVcfYMRNtyJvZVfWe1mqnd9QO7+uSEdMfIaZSkzhZ4xeD04PDNUIVz+vTGiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uEDtv6Y6Iz5wvphTnAylDOPOcwe7/lF4U4WP++MuLO8=;
 b=wNCoIxOOfJZ0UqEG8h+4wiQYYJUAdqKzOsb7aZEMy2JAT7ohKliinpOE9hAagKFOs8d55q+WQdtIRG5XPje3XC/kUapzk8w+sVkYHchXOX30+F5htd/lOHAQ5TY9uLOXF5cTscNNZtd5hob9ZSldQdY0bsU5Aiqbc9WxfyL+gCuBaVZ2iCENpdE88YB79CdUM1FLXjYGeO+JyjSjkvTDxhsHso1keT4U94fNUgDS9pSY8a5B2ZKew7BeNQI3tNZ96DgtHdxiTT5WVWo62mZjX56NtGL4AVsfBeh3pUyeIx/7nAXPNzm9Uj98TVc5dI5Ql9E+voJjX9g5pcE/djMbAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uEDtv6Y6Iz5wvphTnAylDOPOcwe7/lF4U4WP++MuLO8=;
 b=c9u1tzPzcLJRh4gjpek+QQoqDk3VNpGHpJRRi/sF9K7kLacdiJJK2DV2xW6lF5w6aVTFJWm9QIpe8M8Db7+W6D1nhe/LKl5qb0pcziIaehtMIryWHdE/SY3oQct5OnYM8Gh0FIVeOQDLMU0ECEfcBnCHSY/aqSz2BHfo3GiI3OM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AS5PR04MB9797.eurprd04.prod.outlook.com (2603:10a6:20b:679::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Tue, 27 Jan
 2026 11:15:07 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9542.015; Tue, 27 Jan 2026
 11:15:07 +0000
Message-ID: <a6dff3aa-fc7c-4408-93ec-73c117e90ad1@cherry.de>
Date: Tue, 27 Jan 2026 12:14:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 03/56] dev-manual/start.rst: remove obsolete
 poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
 <20260127-remove-poky-references-v2-3-74bf80cc4e5a@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260127-remove-poky-references-v2-3-74bf80cc4e5a@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0181.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::7) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AS5PR04MB9797:EE_
X-MS-Office365-Filtering-Correlation-Id: cc9507e2-c8c2-4ade-ed44-08de5d9553b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Nm5aSVhnRjJ0THQ1WThoZXRrOUl2bXloa0lYSis5Mk1nS3ZUWGFzOUxXTjNv?=
 =?utf-8?B?cE9KRktmMXpkamdOZWdNTGdjUDIreFFMTWdYM091QUpJdkhreXYwelNJN2pX?=
 =?utf-8?B?SStKU1ZXNlUvdk5VUVhlbTFBZkxMM2h6MjNIa3A1Z2lzV1F3dTd4MU1BcHVp?=
 =?utf-8?B?dHJldVRDMDFjMDJNMmFaelduUE02TUlwb1VUKzhicXpIbXFNbFV6c20rSDQ1?=
 =?utf-8?B?RGZrN3ZGeGNaRzVRNk5QSmszL1BiYlAwNnBaanhJTjIwNk04RjJjUGlob3VZ?=
 =?utf-8?B?VVM2ZkwzcU9QOUlTa3lSYkVEcjBIY3haY0J6ZXo0TUF2Qit6R1JzMkpZUGp4?=
 =?utf-8?B?akR6aHczMU5wNm9pZFlXanFXSUl4MXk4V0ZLN3JtTE9NaVNERkhqTEdQZVlR?=
 =?utf-8?B?cWtJTFJpRGJtNWZxYkpqQW5rVXVjYWVjZEtoU3plcGpqTktLRTRzV1FwUFUz?=
 =?utf-8?B?VHFHMXNocG00RlBCaTdWdXpxY0JsanEwdkVrVHRwNG9OUHBTVnZHZWhERDlG?=
 =?utf-8?B?Tmk4blJwMHVkemdSZnhnS1hicktyYkthL2pzNVFJR0FwT2JmdUhNS1N0Q3hj?=
 =?utf-8?B?N2xtTWRyTmxMS253Rzh1cDhqL0FOckg4dzJLRjZ4NkxWVFF0WVF6MjllMlFw?=
 =?utf-8?B?eGNENUJSOGJhS1JDRGp1ZFhsdU9xUUJFNDFQdlA4d0o3aXdkRnc4YStsc05F?=
 =?utf-8?B?RWd5TlBpbmhqeDl3UUtLbjcvS1IyNTdhU2FqWnFTbUg4QWorWlZkTFRwNWNl?=
 =?utf-8?B?R09YV3hOYmwwUW0wYnZIR0JGMWZ3ckVXQzR0aG1qUFdWV3FHSTZPZnRmUXcv?=
 =?utf-8?B?T3FkNG1NcDhocGdjc255TjJ4NVo4Ym1ram1wNllhL1BVaWFvRWFSR25PQTRQ?=
 =?utf-8?B?NlNkTm1oQ1BwTjNTeE1qMzRYaVZxY2d6Ry9aQXpndU5Ja2dwYzJPZ3hscGFh?=
 =?utf-8?B?T01mcUtscFRPaUJFL0tCVUExa1BIT0tLRHZxZGExdXlsZUlnSFZWKzkwc1F0?=
 =?utf-8?B?ZEZIZ3grcHdvK0gxWDF6YWlPeGpiTHArZDRqaGF3Q0duZDlNREdocHdXdWpm?=
 =?utf-8?B?M0pPZVhKZVk5WDgzbURUR200VFV4YXlHZDRoR2MyM3NWQnA4OG9Tck8wVUlR?=
 =?utf-8?B?cWxGR05iQkY3Q1U5YzZpcERSdjhMbGlGRVJMTVc1QU12cVd5azlwYlhJbVFM?=
 =?utf-8?B?TDR0dFE2OTZ6dXZhdXBHMjliV3h4UEFid0tmTk5ySjFZUndVOXUwbERaNEtW?=
 =?utf-8?B?aWErSHRuZjVVRDdWNDJBeVFKWjBMMjNKK3djazlreDJjUU0wUFhSZ0hpVWVT?=
 =?utf-8?B?VkswNlo1OVZrYkt1RWNlMisvTU0rMVg4Si9Bb0ZoSE1TVm1weFozZDdaeUtJ?=
 =?utf-8?B?YlNPWWYvUitscGFFb1RHUlZXYW5BanZJQjFSKzhTeitiODRpNzhpaGtEVXpZ?=
 =?utf-8?B?Smw2RXQrZzhsMWlBcXFIVS9lUzA1aWtkdWNoay83UEVzblJLUFVyRFRTUVFw?=
 =?utf-8?B?WW5kRUxLR3NHeXFwQVFUbUJxQkN2R0RmUEI1cmdWQ1NKaldmTGYxdDNDU2FK?=
 =?utf-8?B?V3RhVHZDU0FmVnZZWGM2eEpUL1ExWGdSbnQvVEVrNzJiZnpjVmgxNDlhY0s4?=
 =?utf-8?B?d1JUMzdJUVkxNjMwUmQ3V3JIamkvbmZ0Ti9lMnFlZXhibk8xWE01c3RHUTBr?=
 =?utf-8?B?VFNsU25FSm1NWW5ld1pld3dhQzRmMHhQd3VubUZtWG1YNHRRWFRzYy9Sa1cr?=
 =?utf-8?B?OXFyVC9JZTJONDdhVjg0YURCazNTNzRUeFptMVpoZWV2bncvWFdFQm5LTndX?=
 =?utf-8?B?R0EyZ1ZzZ2JUeTh2d2tPYllHUHVWWlQveVpKRHJiZVZTWmZjanp5UW1NMVdB?=
 =?utf-8?B?S01YaEFqOVdLdzkvN0ZRcHlzM1YvQzB0eTc1b1pnaXg3dk8zVjJCbndROXlr?=
 =?utf-8?B?ZEJOcTBoOTNqaXFSVWtqZi9UOTVlZTZONEdXU0RSZHcvNlh0MkpGUHhRZXJH?=
 =?utf-8?B?d3AwOE5SV1VlTHBzeXc1OURRcnkrTVhzUFNFd1V5OTlVRGtRekErR05JS1pU?=
 =?utf-8?B?WXkzUXFvdGIrZi85UWc2dERmZTIxYmsyUkpUcFV1TmZsY0JMR2lGblgwajE5?=
 =?utf-8?Q?bzrY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WGhDdDl2OWlocHdubnA4Y3Z4R2puR2t0ekU2N3JML1VPWTcwKzFTNmg4Zkgv?=
 =?utf-8?B?alBXcEtMWXFUR0NnQkhwbG01TGQycmpVemxSTmtjOGRuN2lHck5JbjByU21P?=
 =?utf-8?B?SFJiYTZNZWp3andOZTF6RlozbEVteXl4N1FCR292ZWVHQmRyNXlZUVFvYUlO?=
 =?utf-8?B?bEo5dDdGLzlHL2VzSFpCWnl1WU9KaWdOUFJPdjFON29EbWUwbzRsbXdNdEV0?=
 =?utf-8?B?VkFIRndtYVk0SXJhK0V0V1o3b3FJR00xSkxkeUFQQ1c1S2srZ25FUVlLZEx1?=
 =?utf-8?B?b1k5WjhvRUNOVmVnMzRXWjVCWkhCL01za2VYSS9kWmE2bWE3QnR6M1hXMFN5?=
 =?utf-8?B?UHZLN2pyYXNnUURtVHd6Ym5VdmY2Uy9lMUxXYkEwZm44TGFRYWZBSUh1OXls?=
 =?utf-8?B?Q3Z3dngzVjIvMVRlQndQMVpSRGw5aDhHVzh1VmM3TWJJdERxSmJPNjhlOThI?=
 =?utf-8?B?a0Y1d0JGd2YzMW5ocHcyMnk3bEw4TDBaUld4TitqN3BEMXZPd0RtV2FRMTRw?=
 =?utf-8?B?NlQzTy9BZ1o3b01QVEtDNFpzcWRuRkpXYmE0RmhvSzF4am9KVjMzN0NKRDlh?=
 =?utf-8?B?V2gvWU9YSEZnakJhMlBkM0pBdkpvbHorZlFCeWV1djdsU0hQVnRQSnJTdlFV?=
 =?utf-8?B?NlJFM1d2cm00NXd6QlNaaGZkWitOSG9Oc2ZZWUNtOTlPQXM1WXZ5WFpmenRF?=
 =?utf-8?B?aE5ydXgrUEtKeEJFd1oxT0VGV1RmUFZiNURYRlVnMGhpUWNaMndGbFBpWTRr?=
 =?utf-8?B?dEt3ZnJWcUR4Nk4raThvbDI4UmdRR3kvRTJwR2Nva3hyU05GMmhwUW54K2hN?=
 =?utf-8?B?YzkwUkxSSTZmME9XV3BwbmovSS9TQTEyR21PRXA5UDl0a09GRmptbkxrSEFS?=
 =?utf-8?B?QTB3ZC9heHpqT3RDR2xYS0cySkxrNTRsZVppQVRMWUVmSlM2UzFWWGlidkx6?=
 =?utf-8?B?Nnhjc3RSNVpGdlVkUW1LeHV0YlU2VmtXVmF6NEMrTkZXaWZ1YStkWis1azVI?=
 =?utf-8?B?Z1NRaHNmMzZBOHNPODFac3RXeHlHOWJEUmo1WEk3QWpZUFBTbFV2cnJYeWR4?=
 =?utf-8?B?NHUxa3pGOWtISGhGMUdDODFRVVRQOWZqUjNoQURIRlFKcnU3YzFkYWZqVkZk?=
 =?utf-8?B?L055a05oSTd4VTBKZUc5QkNQVEMrZEo4TS9RTEFrZ3hNaHU1T2RkOUdxY0lF?=
 =?utf-8?B?ZmFhYVk3aWxMUGRqREFTeHJ4MlZ2a0wwSGRVTjhranpiUGhWbGpOdDZhY0JV?=
 =?utf-8?B?QTdLSGNNcUU5NzZBcnNqdkYyWm5KNVUwLzYvQVdGZWJQRnlvQ2lJOGJ0djR1?=
 =?utf-8?B?b0h5cmQ2WEszWEJ3d0lLcmVZK25GU3dQN2tiKzU2UHVodXQrN01YWHZtaVJ1?=
 =?utf-8?B?YUhwOWhtbjYrdThxaXdhMHBFYzE5VSsvLzFFZnNjbG0xSEJZY1I1c0VuLytu?=
 =?utf-8?B?akloQVlPaTNvc3NaYWZWKzFPOUhvRmlzajAwb0dySXVBWHJyR1d1Rm42dkhw?=
 =?utf-8?B?QVlpVUxnUzlpLy9aZjVwTkxTR255cWh6RTdzZVpkdEZDa25uaVFKWi91c3lI?=
 =?utf-8?B?c1hBYVJlak9rUWVRSjBnTWdQVVdUNGtjNjlPVFFMV3g3dVFad3VxanhoL0dJ?=
 =?utf-8?B?by82YjE1UVdjekRKYmluYW1XYUhOeVNOaEp2eTJGckhtUStLdFdReFlBekNp?=
 =?utf-8?B?YkxETUgrdGpDaFlCeHp5SVg1S0E3TWJ6TnZMWDJrTmN1NkNBSkI4Szlhd3Mz?=
 =?utf-8?B?bHJXN2tUUlhBSXhyaVI4dDJJbzVXUGRqTXBMZ3JMdzc4QWU2YlVIMWJMa3ZZ?=
 =?utf-8?B?NGFGdlZoQ21lSkU0TG9FRTllRkhQb0hrbC9sVHJKTmFOakVsR1NpaEIxSFhT?=
 =?utf-8?B?UDF0bngrT0NzMmhPK0J2c0ZjbVhFb2hweFFIYWlQQUFjQ1BKeElLcDFnMHds?=
 =?utf-8?B?NEFqdzlURXhYNXZLaXVXMnRJSzVEMDR5TGcvMlhjVFFyYyszQjBqcGovRjZL?=
 =?utf-8?B?d3oyZmVuZnRBZmNON3ZkL205QXR0a0hvK3RTb3kvbndLOGJFOFZQa0RmaXQw?=
 =?utf-8?B?M3hXTUhXK3FKbUdFVEdkQ1RQRlkxOUpsZWU4UEpIQ2J1U0lGbzE3bG9ZREZa?=
 =?utf-8?B?RkZ5aW5kMFdEZVd4TWd3dENGU0ZBejdkUVVsMktQY2Z5dkZjQ3EzeVU2YWRF?=
 =?utf-8?B?bkd5K2dFWHZ5K1cyRHk3MFFTbDZpbGNEalJQM2QxMXpXSW5VUVpBbmF3d1R5?=
 =?utf-8?B?VitvR0RtcCtha1Jhcm16YmpTdnBmOVhUcGhzL1JVT3ZCQ1ZNeUIzZmUwQXVD?=
 =?utf-8?B?WUIwdjFPbUkweHFxR1poL0JCaFR1Mk9VbmpDRmlod0hQTnZ2SU9VVmJaUmNs?=
 =?utf-8?Q?caaG5JgGP1xjUBTrFyWTeZitW9m6t4dSAdi6S?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: cc9507e2-c8c2-4ade-ed44-08de5d9553b1
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 11:15:07.0097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k2kgHr5y3HwI5SxjGw4xcArsB4hPZfbL9GE0+8ha5bdl0gl3ui0H/E3TkNxyCnqs29RsVEWFZxXFVOfgbVISIxAPK3xXE95cE5O9QdqANWY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9797
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 11:15:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8730

Hi Antonin,

On 1/27/26 9:18 AM, Antonin Godard via lists.yoctoproject.org wrote:
> The Poky repository has stopped being updated in favor of bitbake-setup
> or manual clones of the required repositories. Simplify the document by
> making references to these guides as well as removing sections that
> are covered in the references documents.
> 
> Keep a "Initializing the Build Environment" as this task is common and
> referenced in different places in the documentation.
> 
> Remove the tarball instructions as those will be moved in the
> poky-manual-setup document.
> 

Weren't they moved in the previous patch?

> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---

[...]

> -You will find there source archives of individual components (if you wish
> -to use them individually), and of the corresponding Poky release bundling
> -a selection of these components.
> +Initializing the build environment is a common task, as it needs to be done for
> +each new instance of the shell where the :term:`Poky` reference was set up:

+distro?

With that,

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

