Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 890A5C46467
	for <webhook@archiver.kernel.org>; Mon,  2 Jan 2023 10:19:23 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.63])
 by mx.groups.io with SMTP id smtpd.web10.32790.1672654760978045734
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Jan 2023 02:19:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=i36dsBlJ;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.22.63, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AUBoWJ1i0Z/TGbYW7WKNQ2ebye6hISukopHyA9t8i3FgXpy9KJi8y4gBclNueJ91t9ndjcgdRbMwlt0nWyz+jE/1fVoXb5O0gMpVcp5cJNPu5BmxVmohWqp2XLu05izlhdAlW75IdHwfHkrT4gCBkT23i6YWZb16kk8YlC8QDdl+YrRFAO8ppdSfwqpz59uIxUml/TTOH2krzLJm4A60u/iQVs2Qqu1IXa9UcZYLSmgs5qHi8qJ0kYVD1dCLTMe2TbraZLwolCeJ05OePfjmMJmGxLrFtcUOMKSj3cT0h1AUsEMdfJkGF/GqE5JqigH/j9gRDyWopR4qdE70CHxXbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lqG5rwpkvQ/t/+AqYcoaW+iCfG9AMJDLdFBkokOpl3k=;
 b=Y5A7+n7/JDMfVTTMhibYm88ztkp2DP4/AZe9TmP5xdF8n9Qv69+geWBeMa99WsagjbcqdnrFNm1oqIiafejL0admpxcFybzUhY8o2v/6rk5OeeGu1XJuPFdO3X+4Tbwqce71mAHBT30SrVyUWW1D2//Ghs6C6fqnrxEBUQ7aDumV9Ky2z7frdDp/Vdfp1UmgVHBlT2W6SBMjk24GJUho7C0N8XqkEViOG5YTf610fmrnMAXYYKQWILKeOgEM+WfwfSzhTERNP1F+nVN3fLzSwgwg0tiZ+5rAYQ3n95hjvh57dX2orfCgimirzDqzyRjFSvqH/DNlfTDqUw9BymrBPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lqG5rwpkvQ/t/+AqYcoaW+iCfG9AMJDLdFBkokOpl3k=;
 b=i36dsBlJzQHGs8gDJgV8jUhqaKwdkZ/9e2pBlrxQk0QLRdyyczWVqF4B10OnvWM18XoLFNmAd6CS5m+nrdWKacgQjVNlXF9PxQqGr2V8mYoCXnmPv8lZSWKSrkO0nwpE6KvfVAQRDgO3GqfPva0a108t4UiYaRvTCtcwcOkqMzdbLI2xKvCqNJWqtqrM9C6FIhc/XZSJOtqjteMOFvDbKKy3iB4WgOgXh0+gEEqr60rL5q99Nk8kDy2UNIKvPy9K1ARuiYjxGT6P1s4JTgkPGfS6svibeU7xG0m6nujnaDwSrP0Til2Rm9ZrY/EWRIeKGfHiDMNTGdUQ9/Ua8r5b9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AS8PR04MB8947.eurprd04.prod.outlook.com (2603:10a6:20b:42e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Mon, 2 Jan
 2023 10:19:17 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9ebd:cd48:9396:76f6]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9ebd:cd48:9396:76f6%6]) with mapi id 15.20.5944.019; Mon, 2 Jan 2023
 10:19:17 +0000
Message-ID: <456184cf-b08c-9eeb-c261-840552bcb5dc@theobroma-systems.com>
Date: Mon, 2 Jan 2023 11:19:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [docs] [PATCH] ref-manual/system-requirements.rst: support Arch
 Linux
Content-Language: en-US
To: Vincent Davis Jr <vince@underview.tech>, docs@lists.yoctoproject.org,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20221227194932.3783-1-vince@underview.tech>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20221227194932.3783-1-vince@underview.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0101CA0084.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:1f::52) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AS8PR04MB8947:EE_
X-MS-Office365-Filtering-Correlation-Id: 08719a5f-1beb-41b3-a741-08daecaacde2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/FPKU6sewikvf7aTx+NkVQEFQ/Vpr00Ef1HYaL+yXKA4nHUcH66UT/4BX3AlJwGIDo1R6nmCsReRKz5E2LFNzsHp47NEfVfWbiyQHgjspErqdanHtr1LRLa2TyO7OnKIc7MZkWBVFdoYjYV/z8FmKIKYLc0CwxSbamma0qsZqLP7ollDw7ybcqvS7PGYvrVJYUa/HMZZTrgh3TJk83hHFCnlg8EqK/Lsw9NFSvcoHGtidyHisKThM3/q6b9Lkbo7V7e97RImmi5qAeQ8HdBARn7k+m6SHntkA/utdglxItvQC6+atyOIJ4BQVa9Op5D05eMlKkPHc7ZDqtCcsizeQpu+IkDY6MflUJuChm/bdjP99jFcfwQFNDxXjcUgTOkugyGYd7vIR3yDMNCfX63zN4U+eGkb01iWxLdss60oXd/QImtp0r0NF4niKVr+oobbHJfPUafn4KFknO4QGbirtDuJ8Ev58tL9ysUGbbUvE6v+6W2bfa1K9NKk3R8mHxqSL5x33J7x0Axcuuif6cTQEgKPWhf7vjltsG9pZz+V7GqxctKyqhOg2kNM45ZdNfvgvOv1aUjDoiZQRRL9/b7BIetd6eFLc315FNnF59kNW366z0Pa+37R6ovpNmcbhjfhQHy2VUfZVNuIe6YS8kQk5lLKr5wSdztTIXvJB5h61mZ/LeHyl9fpYypyKA/acVBGQYjMe2AifXJAlnpovXfYmw85OGCJ3cGaW0DVcbv8pie7u9Bq+f6frR6HBUj/WNQDp79dQ1vOsber3kwNmyfB2Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(136003)(346002)(39840400004)(396003)(451199015)(66946007)(316002)(6512007)(31686004)(6506007)(186003)(110136005)(44832011)(5660300002)(2906002)(6486002)(478600001)(6666004)(41300700001)(86362001)(31696002)(83380400001)(2616005)(38100700002)(66556008)(36756003)(8676002)(66476007)(8936002)(22166006)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZHNMSW0vdkh4WFdZTzJQejFIQm9XWUprbmVnMG5mU1JMTjUvK25Cd2FRZHE3?=
 =?utf-8?B?aXpwdHJRQVNtQ09WL3hUMlRzdGlVN1F4aHROczRYd05CWEhtNVlacEIxTXdH?=
 =?utf-8?B?NjVyaStXaU5BRFFCQXdzNHIrNm5obEVkL0t6TXJnVVZCZVlJU3V0VUk0T0sr?=
 =?utf-8?B?alh3V1FsNkVSUFpxZU01TmNZN0VISzRWSmM1dm0yRzd4WEZIMXZwZEhCUHJO?=
 =?utf-8?B?RHNpbHFSTEx5cXJ5TzNURHVzZmVwZDlidlVWTVFFTFg3dXhibHgwNE5KUFlY?=
 =?utf-8?B?YUhOVktXaDFWSC9rVy9FVkhhQUpMMHRIQUtHanZGZlVMVmNISGZPQTRKSzJN?=
 =?utf-8?B?dkJqT1VtN3hYWmlrT0FFZjg4WjQ4ZXhWaVJucFpKa2VPVE5tZW8xb3lPb0lS?=
 =?utf-8?B?OEZyMDh3NE1VSGJRYzZkRVBYdCs1ekF4Q2U4YSs5V1RMYzNNZkNnL2tJbjky?=
 =?utf-8?B?ODJzd1VuQmlBRlN3T1VOQUFHVjNLMXVvcno2d25wU21LczlmNkpZMldtcTJp?=
 =?utf-8?B?aXJJN0FIVXhmMGExd1B1WHNjdDA2L3cySThDaS9wempkNUFocVB5ZVRSbzlh?=
 =?utf-8?B?WmJNZjNQOFpCTnJlc1lkVE5MK3hGcEMyMC9sT1NiWHBTWU1TcFh0UWdmRUZw?=
 =?utf-8?B?USttK2M4M2dhWHFlM2JaTG8rYUlJZXNVcVFuZjRGNk5yWnZXeitiWVdLdU5V?=
 =?utf-8?B?UHBFLzhtQzJDRm5EdTk2RHB1aFRNZU4vZGpJd1ZtS0s2NDZqK083WndVcWhW?=
 =?utf-8?B?RFUvd3FTT1kyeFV2UzE1WnY5elY0aW1XSjFxT21jQ3JjT1VtZk1FdHdPeDVk?=
 =?utf-8?B?RlY1Q3BFTDFJcElsczVnT0NCSHh3alZ0ZkpoMHdVNGZvbERkWnl0VnpnSFVa?=
 =?utf-8?B?ZFpVcXlJdGZ5YkJpS0JJc1h6emtlUFVLYVRVc0hudk4vamhMa3VBbWF0VHNY?=
 =?utf-8?B?WTVKZGNLOUMyVnozU0RPV3VvUStibHpGZU4zWG9nbnJDRjZwczBIQ05qZmNL?=
 =?utf-8?B?NnZ5dWNRTW9YR3RNUlZZVXZTU3NvQ3g4dnFFNVh1NGtPTVJCemh2UmMrUnNi?=
 =?utf-8?B?cTRxRUVRTDF3bUF3d1oxZVJBd0F6ZFlaY1N0aHFTalAwNTBSbE92ejhyTmJ4?=
 =?utf-8?B?MjFvclU5ODdkL214ZEFxTUl4U0dWWWJaY3RzWTlJSm5ScDNXeCs3UEY0dWdJ?=
 =?utf-8?B?cWdLVmx2cVMzUnVxc1ZqOHdaT2FwWFpGWDBDMmx5UmNjMDRnaFZ4dWI3dmpC?=
 =?utf-8?B?SUNTWXhzanVjc0dlaUVTdUJRNm5jNlhsRE5za1hYbVhSUDJFZlZucTB5QVhm?=
 =?utf-8?B?emlrTnBYMlJwZE9YWWxCeHBSTVRrOHArb1k2K3pTTjRNL25FTlRaeW9yTWZi?=
 =?utf-8?B?ME9TVERWNG5EZW10cTM0d0MyaGFTMXo1ZHV4djgwNDExaTFjdjhIclFyZ2Rv?=
 =?utf-8?B?QlNvM3g3b3gyMjUrNGFiYnhHeHBNNVBhM0paQTJVbHRPM2N5OUQ5QnpRRjlI?=
 =?utf-8?B?RnM3cUU4WGZsQjRHVEtCQmpsZHRySitRbG5Yb3A0SE84Qk4xZ0VCRnlLRVVi?=
 =?utf-8?B?ZGFUSThpOHNueGt2WGxKU0lDQ3VFTjU3MkQ0MTJuc0VpaEJVZ0VCUTl6ZmZV?=
 =?utf-8?B?cDVrMGFMbWREK0Q2cFJORnBlb1pyN2pxVGltLzF6TG5KQXJRSDdFN3VINGFD?=
 =?utf-8?B?TmdHMVcwbjB5WUxtT3NHUk1jY1VXOUpyOFNpaUJCbW1UVnpodm1uZFNQbk9n?=
 =?utf-8?B?clZpK2M3anNzcjZKMGUzV0FqK1FUNld6bm5zN3NYUWY2ZmJtMDVUNnFTOEto?=
 =?utf-8?B?aEdYemM1eHBxM0FaamJDM0RYL1Rkc3dnQWNZelg3RC9ZVUVka1paVjJkTFdn?=
 =?utf-8?B?eUR6dGNoR0ZqTnRPbUVsRFRxQlB0eHVvQkEzWkF5VHlnRS81akljaStweVEx?=
 =?utf-8?B?N1c3WGM1cmdoQWlMZmtxNkZ5VFRCNzN5Yyt5bVEyODgxRW9JbW51NVFZRnVi?=
 =?utf-8?B?ZlJiejFlTEdNditiMVlidUt1b3d2VmZjb3BLc1ViZi8vQlphdVQ1Z2gvYVdO?=
 =?utf-8?B?ekE1ZkFBRmdEaVFQQnlpa1d0VWFKQkdKZG04Q2F5T3ZTWFBYT2dmdmV3Qndo?=
 =?utf-8?B?dTBZcGdEUFhLWHJEa1QxNkhMNW9mN211Ymw5Z0VuWjJnL3pQUHZ4RytGd2o1?=
 =?utf-8?B?QzJhdERxaFNscVJka1VhKzhMNHNzTnE4bTFTSDZ6MzFqOHYrM1hOK1l5ZHFP?=
 =?utf-8?B?cUdvU3NHM2t1WDcwbS8wUU1xVUN3PT0=?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08719a5f-1beb-41b3-a741-08daecaacde2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2023 10:19:17.1898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xygEIyiMmb7gIOcMTaOh4676V3pQg0FAgYjmCzwRdfjov9HVqkClg+2M48t092/XNsOI+g+U/A+b1pKxjOiaxXr42A15vmG9+t9hKpLl70OeCNoFPFRWOIhkbNZevL5w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8947
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 02 Jan 2023 10:19:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3564

Hi Vincent,

Thanks for your patch.

I'm afraid this will not be accepted. We usually refuse to advertise 
support for rolling release distributions.

The advertised supported distributions are tested on our autobuilder and 
we don't run ArchLinux there. I would expect we also don't have the 
bandwidth to debug when things break in ArchLinux. Note that we also do 
not specify support for derivatives of Debian or Ubuntu distributions, 
we have seen issues with Pop_OS! in the past for example.

For this to be accepted in the documentation, I believe we'd need 
patches for the autobuilder so that some builds run on an ArchLinux 
server. This probably needs to be discussed (and financially supported?) 
with Michael Halstead our sysadmin. But first and foremost, we would 
need this support to be agreed by maintainer(s), hence why I'm Cc'ing 
Richard on this, who I hope can raise this to the proper board if he 
doesn't veto this.

Considering it's holiday season, please expect some delay, but don't 
hesitate to ping us in a week or two were you to not receive an answer 
meanwhile.

Cheers,
Quentin

