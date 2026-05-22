Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 457B1CD5BB3
	for <webhook@archiver.kernel.org>; Fri, 22 May 2026 16:20:22 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20769.1779466818442387495
 for <docs@lists.yoctoproject.org>;
 Fri, 22 May 2026 09:20:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=en39t9kD;
 spf=pass (domain: cherry.de, ip: 40.107.162.49, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nVGiVjZbjAz+RkychV/R2ITaxeMQNUeQUAFR11Gwd1Qt79p+egtOMU3RUHDMT7ejTTRIQ5r8THrqAUTiMJgdnGo89Xq4JQwJ0FuusbdJ21gXC0KZB/Li4CQ5+yyPmIyHGsikT82Sm9ZsQ1SRCEfW8Np0AUPYlVdVuhyJezDDdRN2vnkEM3PUsr6J7WA3wM2pn8aUtyVUVJfK+mxftYR2BYluesx14NK0EWS+C78Kb6p5qb5aS3cJbTir+XTRWYEt8Z31V6qVWHtO+chSv9aNtpbxRU6v3SwCg6FeFL458lI3zrAX7ex0sV75DBowIZeceduLvh0ZRkB9ni+fsgtODA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C6gt4YST3gkzCTeWbABNtQZSPJhu8U3WrsXpUUSgXYQ=;
 b=kg+zljXbeTNVZlicOPdf5BpyMbkQ88zmWxduq+aSsabrzFLfv+EkGXr5OH0IvTKTsObcaHwxUTIpNyNWtuqR29G8FtAYa0kfo4ZqjgbWgqfzTOUuhU2QpnnYgHUae7B73bWovd+AjWcKRbsJ6LCSJFCoFsmlwmyIeu/rxrFYs04Jiwbp4GbqL2ikXCZH94cWfGCC/k5jLqqWDJPDvSSE5YHS1mLtQceVfqxueMdo7Fe8MtsQAkm9JWhsL6t1tkDmuAAYKmigXHdTCRF+bZzaicnotoxVq0e/8uV4DUpvx+XMDdNN9jrzcQMnxcWrXlnLb4/tJ0z1wJBx6IIa6rO32w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C6gt4YST3gkzCTeWbABNtQZSPJhu8U3WrsXpUUSgXYQ=;
 b=en39t9kD9Qp4o29T1uLCk/5MnROWDRhRX+HFAP1Vj3JgpjlTdcxTd1AxS/kG3r80EqRf3/IbammHyd46DG3XiVb4UsLJBVTIKUEMttm4RM6BqRVQEFylPvAZch0DJRDuh0jRn3iae9j19hmCy2JSX2SGBv18FePAzEhMBaBDvxQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by GVXPR04MB10204.eurprd04.prod.outlook.com (2603:10a6:150:1bf::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 16:20:12 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%3]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 16:20:11 +0000
Message-ID: <005af954-7f10-4b76-9257-d86b25713d32@cherry.de>
Date: Fri, 22 May 2026 18:20:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual: clarify that PACKAGE_EXCLUDE supports
 DEB packaging
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <cb7c2ab0-bf11-5fa5-5730-2776d56dad0d@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <cb7c2ab0-bf11-5fa5-5730-2776d56dad0d@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P190CA0045.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::18) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|GVXPR04MB10204:EE_
X-MS-Office365-Filtering-Correlation-Id: c2bae008-b7a2-4af6-0b66-08deb81dffb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|11063799006|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	TMlQ9MxOfpDxsiUJdlAbzzEiSuNLvwUzj/S6KgvZ47Kq+pmVJcLFXv7FIxf9G702tDH5Zexrl5ZVCrZqVUuhFDiIal//XkLo9PncVS0V4DC4OPlQnyMog/Zq7S59keAlXnopTnouGVSbZplVVK4FNU58rKNuZJR3yFepYB+t9VVn9KSkdXy8pdLt3fFkvKYEWnwyMYJvjOI7Tx02H/CCWDtJD95EsPG/9OO3dtkwKDeB4IGefvcjLXRHlEjz93c23WhIpet0kXrbKfHEKAeJG4QIyHjNlpEbzFpLLzAXfrVRBkrAIa+oyZtonkzxCUoKHkrJmbgl8LHyI2Nla2WqtjrKBGLcXtReFOtUcIvtAvu47Pr4q+gB+2rXhJB3bYIXeDjbul29qfJFBgvCSIfeSgtsNqC8sJ1zUvPEErCIb6FpI+wgILaM1cUtpYgStwpRS8NwHZFFHK90doDvhX2fmsHS2OQ2i0XwRFJiZbtwDXqf930oZeVljHps3jA0n1BHVO2SAKNezpsYwAnp3//ClQV5LjvIMhAz/a3QA5DAwOxbLaJWsjyR+g7t5SZySlAlYNRFyuZAmePzN0N5mWxS8p1ycOav0JX3VwUR81rVk5WE8+nN6ArpiBvgtjXX6j/LYcm0gUq463hR/7/AZUjeBU5ebwRNrbExnYE54BCXd9isqSn+bLDs2b/V/ijo1VRF
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(11063799006)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RlVQbVRxQzc3TkdPNFEvRE1WQ1E4ZkU4WE1lMDZYRVBWVExVWkhUOUhXYmxP?=
 =?utf-8?B?cGtnRTkxZjdtL2F2MFFqKzE5bWk0WktxR0ZBN2t3blA2dkluM3hFK2ZtR0xa?=
 =?utf-8?B?cDZZNWRXOXpWM1VtSWsyQ3VhV2t4TlhIQ01JaXg2djI3VUlSb1NGeU02eTVL?=
 =?utf-8?B?RDBKN0xZMk1MOUd1OWNZVFlMZXE3a0JmQ3NwU0FQY21vMWhaYUJzQmRyQndK?=
 =?utf-8?B?a25Kd092RnpHR1Urc1FkY0NFR3NkL0Z5Tm5ybHo2VzdUdTVvY0hLNGJKekUy?=
 =?utf-8?B?ZUpNTmN6cWZVVTlXMFIrS2ZLa052TjF0UStaMmtIdGJ2bERyOUVyak0xNW0y?=
 =?utf-8?B?MHpDK1NycXlrdXZVdlYvcDY1Y28yRHo0RnF3QjVGM0htYzl5Mmd2R28yR1Fv?=
 =?utf-8?B?MStFQ3BQUURqb2FudEYxLzg1VGkxZzIrT09PME5CSHoxTjlld2ZGdTlVUlA5?=
 =?utf-8?B?RzJ6ZEpUMVZjNTFzcEo2bmIzenMrdmdtT0lhS3lzMDd6VDd4dC91L1BlQSsw?=
 =?utf-8?B?NTU4U0xkSDVpbGJmaFhmLzB0Z2Z2bDZBdFhVblQxTUFNdEdZNlZzb09USy9J?=
 =?utf-8?B?S1lLeElzQlBFWGMrdDhibnpmTWNuMmR6RjlKZ2hDbEh2MzNRL2RMaG9qR2Uv?=
 =?utf-8?B?SHJvTGJhRnpCaVF1b1hNd1VFVWJvQXBaK3V1TTBraTBqRHI4Nm9IbzZwTEhF?=
 =?utf-8?B?ZnFqNGhHbnlzR05vSmV3RkR5ZjE3Q3hoTVUwNDdLWDNFaUtMVWZIT3g4c1Vq?=
 =?utf-8?B?anBoVkpZYmYyQjh1Z3R4Qy9oY25iUDk2QVNYMmxGbWV3ak53cnhFODE4WDNy?=
 =?utf-8?B?T1dpRWZSL240am1sWjBQYjVtelZvWm5QWm5rYjZ3Rjl5KzRSN21KVFJqcll1?=
 =?utf-8?B?NE9KTFpCSmdFV2krcGhzVWVZdXpLNHpYTGdGQXovdnJoZmx0bWpZL0lkNXNU?=
 =?utf-8?B?U1dOd0VmaUZEUER4cnk0Qm56QUVXMU9JZ0dWUUNTemh1ajBQRzhKQ3RqT0E4?=
 =?utf-8?B?WWdCQnZ1SjIxRTN1M0traGd0eE82SHJvUFZZZVhKNjBMZ2JNWXJIbC9YWFk1?=
 =?utf-8?B?N1ZhdWxmc2hRYS8ySFF2emJERXR2MDNQT01CbmVLN24zdFBHZ3I1bC84cnFM?=
 =?utf-8?B?VzdZd1JDZXhJWThoSElWTEozUXVaNTFuRThIc1NLRkdCWk80NjhZVkxsSVJN?=
 =?utf-8?B?YnpTelFmTnc2Kzg4b0hJeGRlQm15T29hb2JYdjFTd0VtTzdHc3R4VG0wWnFl?=
 =?utf-8?B?MXdzM2hNZW9ZNXlUeDZGZmU4d1NyUGZoNXNRTFpuYlYwOWJKUlc0NHovMHVB?=
 =?utf-8?B?T2dtQ2tROW43ZklGdUpuRG1FRVhuSjdLaldzRjU5cncrd2lyWStaWGc1OGho?=
 =?utf-8?B?Q3p3Zlh0MDFocnFxbEp3UEltZ0dYQnA4b3RhMjJ2cE9zMFVrWis0QmxGSy9M?=
 =?utf-8?B?V1AxdllER05rb2hTaHUrZmhjS3BncHphdUg5MENIc2pPWW5zUjlwSjFYZXJK?=
 =?utf-8?B?akdSeThXa0pJcDBacnlrcS81SThiWjVuTDk5VThvaGxnZno1NkUrZ21KQXhz?=
 =?utf-8?B?RGRqTS9rRXVBWGhpYU1CcUhZZTFXQ0Z4a1FPcGJrKzRUUzRnQ3E0QWNCb2dt?=
 =?utf-8?B?bUVEeVgyWFA3ZlB4cGtqNmZIdE5lRkMzT2J0OEt5aWZLWFVvbys5WmFGSlVx?=
 =?utf-8?B?K0dUVGp1QTF1Q0szUEVSYW9Fa21ZUG1FUmNYMHhEMWVzK2tYVHNRTm1GVHVO?=
 =?utf-8?B?aHJXUHRDcTVmTWg4dytuV3l5WUJaWm1rRnU2TlhBdzdDMEJzZHQ0S1RtR2Jv?=
 =?utf-8?B?TTJod3pzbTRXdFQ1Ti9VMFZZOW9MNXhLakIxUlNzQzUvSWZ5S1pnMkdDalV2?=
 =?utf-8?B?YmtSWkFpek9OcmhrNDlWWTVFaDQ2WXByNTExUER5RWlqbm1tSnhINlJjNnVF?=
 =?utf-8?B?TDNGbWcySEgrY1JFMjFZNEdvY1p4Mmh1TENxRGp6SmJOaDVUZUxUY3VZQWdp?=
 =?utf-8?B?U2FxQytVaXI3dDhubTdoZzgzZWFsY0pvMEt5dHZPQ01rM3VZcmVVOGhpRjFF?=
 =?utf-8?B?RTQ0TzVjNjdUZVB5VjBIZUNUMkFsYUpVR012TGpQclJOeVhyZGk5K2pta1Jq?=
 =?utf-8?B?K1FiWDFrN0I3SHp3ZnRmZTduWDl6M1BSa25hZW5KdWlhNGdBNUFvdUU0aVFu?=
 =?utf-8?B?Z2RJbnhzWk9mZW93YUh1d2FISG1FdU05cXkzam93b2NuTm1LdHUyd254SUJE?=
 =?utf-8?B?RXRPb3JiMm5SeGc5Rjk2WkR3bExWbCthZGVkRThqR2liSWlQUFV3azB0d1Fy?=
 =?utf-8?B?VHQ1Zkh4ZmZxckxLMVN1N2pUbU41RXFVZURMeXkyV0VyV3hPVUZ4dz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c2bae008-b7a2-4af6-0b66-08deb81dffb4
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 16:20:11.9245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bQxxhHoAYWZE71HbrOvOj/GJeVXWy6/kYqdOOJr7ny6RfND20qbJckydjBewgBu2gFQpmvn3Jvkn7gxJkS2N4abCo7FK9pse3d7FEk5OA4w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10204
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 May 2026 16:20:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9529

Hi Robert,

On 5/22/26 6:15 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> As an accompaniment to earlier commit
> 0d05dedd62a6d4c726f120a23654ede1f0b23d8e, correct that the
> PACKAGE_EXCLUDE supports the DEB packaging backend.
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 
> ---
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index c65794229..2773e9864 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -6927,8 +6927,8 @@ system and gives an overview of their function and contents.
>         an iterative development process to remove specific components from a
>         system.
> 
> -      This variable is supported only when using the IPK and RPM
> -      packaging backends. DEB is not supported.
> +      This variable is supported by all of the RPM, DEB and IPK
> +      packaging backends.
> 

Considering those are all the backends we support, can't we simply 
remove the paragraph entirely?

Cheers,
Quentin

