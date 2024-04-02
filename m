Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AEA4C6FD1F
	for <webhook@archiver.kernel.org>; Tue,  2 Apr 2024 09:52:49 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.113])
 by mx.groups.io with SMTP id smtpd.web11.8569.1712051564256594076
 for <docs@lists.yoctoproject.org>;
 Tue, 02 Apr 2024 02:52:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=gPjFF4sE;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.22.113, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OfLFdw45V273NOv/bS3yhFbQ4yCg1NlLfLxRr4OrFsAUB3osy4tYvGCsRQFhyM71zyRDR9301syc4dQLXmEAaykzBkma9sSqyyUU1mj4czR1PbIPZIf8GHuRCnVYSNNnCA28Si184g4f+lYiif80MJWgHbElOV3CMhukHQxkpI7wK2UX2IaIrGLfWX+xm/pKYLVXGEDKmhG407euwZaEuGO2/+zQ9dGswi6g3Ak1KeWmnMetucNRtnsCJhNvZOh+t+xSZGnkNfU5+zcnmkkmvrY1EcUtWOEIH1JagpMHQM1587THMWNYVhOUpsB0TqhMzaa2zELom4SHMZJwIWdA2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CLkrBOoq3ofkZpDWU6c6Vl4VmkFexPySc3JPWmrw23Y=;
 b=X24RRBlyIgA0orCTFLFqceW+/Gmdj9Q1GaWnfjPfNI3dy8+viUFAufZTNrlWh3CeZ4NmMsUO8XuTWXrAc/dyk//CYRcE7QfSJNlGhKB9QMsUTDXe0GXUyBtU3sHN4vq9calnsla/XVFTMbi6DuotTwsmzY6vgjlA+KpONcndQShagASAcOzoBFhh3WXsAdnoJI5YaCyYvR51EqNfbcmVFuhgPakxpluTGHL0YXGOZfiA7w1NpSozhVpkdKmHjX1sqjQ31SM7kbtaxsQCV6JuqlJxoHFIiTQUYLdzavRmqCeEHoUKcnnxIB1sfldxdkI3D8V5o5P58zaZLcZjpKMlYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CLkrBOoq3ofkZpDWU6c6Vl4VmkFexPySc3JPWmrw23Y=;
 b=gPjFF4sEi2sPkQP4wXH2C+Um7WDEWHOZx37FSrfHtgGZe1wBYwjFa/BGMYVV66RHzB9VIYeL7H/VGIFQeM/a79ZJYR9d6u2Q4kcQUNl21w0VP3Tlrjkiza0hc5Vs1vfP15ZWF3Pp3SPmZ998ATHxDBTzlktIW7TqpABsL1UVA/+nkwX7d0TP7p5Z77vvzVEazgAKHNnspJx7OFahgfZSW/+esseSIVGu/FrC45QZ9O7ad8gpQaT6TI134pyGECoMQjvM62eW8gXuv76dr4KjVcQBUASWzSz6a7h+alDUxqcX0KrO9AAinzQpi5VL+4Ep1dX8ZSEFBoCbvNcQh5kjCQ==
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AM8PR04MB7251.eurprd04.prod.outlook.com (2603:10a6:20b:1d2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 2 Apr
 2024 09:52:40 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::3e70:7029:faf2:7779]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::3e70:7029:faf2:7779%3]) with mapi id 15.20.7409.042; Tue, 2 Apr 2024
 09:52:40 +0000
Message-ID: <dafba4b0-d6a8-492f-a1da-44a3ee75e21d@theobroma-systems.com>
Date: Tue, 2 Apr 2024 11:52:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] manuals: fix duplicate "stylecheck" target
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
References: <20240330162440.1734248-1-michael.opdenacker@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20240330162440.1734248-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR02CA0052.eurprd02.prod.outlook.com
 (2603:10a6:802:14::23) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AM8PR04MB7251:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Isj8esJYPabLuqkrIVHSHXInw0cDuNAKphOB9KZINuqdmD5OFUpeGrM2u5ouxJepLy+VeJwgwt80GIAOmxG81ysbSC8oYnCFoKKzJyu85XstBwwlOyxibgU5ROh9GoXV8tkSySY5VPX3JEzFI2tF9ae05aACjslxbX3BnjOZpS2aZlSghot81ba5w02De3GN24tcUc32yCq4WRxwzAXJXi969lFGphqEHsFdjM2ZCLEmq30BawnrV0UkIL32ACoP+3PJI/AgW/wfAsAaKk83k3DyclVfuiWgndTu2ixYM1cwLFX3tHAESVHp44lSeY00SkW03J+hzEPuK2cja+u7UMRAScS1ZU86PjZqZJ2/QQEyTrIeyaXeLqF0lpllivLqsqgxgflHo8WiVUsOy7UlAMyenUwdERwJJF0TRU2Y/K4pHDSHIJ1xAXhK1cIc+lLbH1BKe/hdJSOjvZCMhTBNHum1q/pC0jvA/ZNCSQyMqBCvPRiiIVqO49SzoBMlHIbOvjU10k6USCQrqe21/dvS/3rLK2y2roXxVNdhPLyk14H3bn5lODQ2zdocgYIE+7zygPT90x1O3HvgPPl+4TCiu8h/+PBMLXnzYSO/uw4rtSeIpWSTrLyClq+761hg+wMFnAvklta8nG+jkBl5OMB0Vg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?a2V6LzlQeVZaNFU4RzhBMHRLSTRkZGdGT2FHQm1wa2RWb2dncy9ablQyMHFj?=
 =?utf-8?B?WFdPdDkxOFN3dlc4ZkpUNkRyQnJtUXN6MW5IRTNxNDlUYlJsZ2d4N2N2U3Rq?=
 =?utf-8?B?RzFlMnhjM2NTK21WN0o2M2N5Y1VESmhWcG9ZM2syVHo1MWc5d1RBYzlhUStq?=
 =?utf-8?B?SThQV0NYamc2K3NrcFlEemNlREhKUUdDMnFub0gzaGJBSlhkRHRZK2ZMYWdk?=
 =?utf-8?B?WldrSWxJMHJaaWN2Q2phemFoTnE2L2hMcHhzVnJMdVFNK3RLSWMxRURrQi9z?=
 =?utf-8?B?UVB3NlVnN3N1Qm43c2Y2dHAwOGQrVzBNRTV4UGIwbzlyc1BXODlNYkYyTDk0?=
 =?utf-8?B?bTRQNzZqOGdxUGJwd3J2eGYvdzJuSlI1bEtoWTBDdE5zOVR1TWdxaXhOOHdB?=
 =?utf-8?B?YktuQzltblNzdTFwZnc0SHVYWFhzT0RIU29aSW9CV1dvUjlLalQzbnRGUDJI?=
 =?utf-8?B?NzcxaFM1Um1EV3NjemFFS2VsZ09JVVdZUzVMM05FM3BhNXpiTlZ2TW9mNGdt?=
 =?utf-8?B?RU1lWHIxSTV0K2FpNGRMd2RqQk00YjNpWGhKNjNnRnZjZ0VQenh3RmtFeXFF?=
 =?utf-8?B?QlJIQ0VBeHcxRTVsR09QQmZXY1BMc2ZKOVhrYWw0ZkpwUzFOTVdkSEtxdlha?=
 =?utf-8?B?VERCb2tvelNTRld6bXFQVlFUS3ZBbEV5MDVwV3pOVDlJK0Y5TncxRzN3ckhE?=
 =?utf-8?B?VkZqODZKdDZyUzJpaytCb1phY2VXL0s3S0g4b3djaC9WckEzSTJ6ZHNwUkZl?=
 =?utf-8?B?eUFpM1RvQjhTT0Z4WmtGVXBIa0tpcVFnMitmRXZSUDVySkNYK1BYOVNNUW1R?=
 =?utf-8?B?THFIZ2VIby8xOUg2NnJNMUFpT28vQUcrZ0FjNkxHYkhRQU5EbWJPL0lqenBN?=
 =?utf-8?B?SWZMT1dTQnhsUVBia01GcjZKUkNyZVBRRDg1ZFA5dEZ3ZTljTHM2NVBhR1lI?=
 =?utf-8?B?MU9HdXk2Kzk4ZUFNU2JUaUwveWxqbDR6dEJJRFc4YmkwVzV6eGQ4WWJEdzJM?=
 =?utf-8?B?UzZRZTRwZXZYakRNZVJGMGs2UU9rMzM2d1dBWUZvWVc3YVArSUt1cjdJUm41?=
 =?utf-8?B?ditmVURiVlplTm1uc1U1QW9KQ3Z2U0NEY0c1clN4Vzl2aUtnOE9BSy9Ub3BP?=
 =?utf-8?B?RXJUc003L0VWS0FxUk1uWFRhbmpQQ3hTTVd0OCtONEpZRjBSbTdzYTMxR0c1?=
 =?utf-8?B?b2RyRGJpWVFidW8wb2RtMzFEWWpnajNUTnhzM2NhaWVJSjBrUUhwSlZJb29l?=
 =?utf-8?B?UnVDclRJVEEvT2lONlBLU2lYZFg1SDc1cWRlMmIrWUM5dVhKQk0yUWlXMTdl?=
 =?utf-8?B?aTFETzlUT2NsVUE0U1dMR1BKN3BKTzVNQjlEWlJZb1Q3VjgydmFuTm1TRVlG?=
 =?utf-8?B?eWg2aHg4OUFCQkFzOG1yQ1ErV2xtc2ZkYUg4MWR6VVlTSFlyM040SU5wdjR5?=
 =?utf-8?B?cDM5NjExUUo3WGxJYW1LVGNRY3hBMUYzTGgwZmtreW9aZVYxRWp4ZEVYcXVr?=
 =?utf-8?B?OVFDckp6bm8ya21xZS9UMjZ3V3M5eEJtNXBKbGcwNm1BVzMxamtncWNwZlVi?=
 =?utf-8?B?YlZkYUFKRzVaL1ptelNic2w2Smt4cEU3VXdaVTZwOVFqcGxHT21tU3J1b0sv?=
 =?utf-8?B?L2p1VDFpa3NVZ2NRYzQySkp4OFVwQWlLQllqa0pVaXpnVkJRamEvUVN4Mmt5?=
 =?utf-8?B?SUQwNzNLMkpkLzVYSnVvTzB2d3Jia091emx5akdUYzNBdkNJbmYwSitCSGNM?=
 =?utf-8?B?VEVYNStGTW8rNDBSb3JobWVPRUdKbnNGeC9veWJ5NXF4clBRMzJSOUVqVXJV?=
 =?utf-8?B?WkRqYUg2dk5YSDlMcHlHNVpQM2R3SDZxRXNlWGZ2Z1BaR0tCZDlxcUFlbkVS?=
 =?utf-8?B?aGRCdEw0WER1N1NnT3hmZStsVDh2NDRqcXNpQnhSemxRZVl4eXZJWGlGZC9C?=
 =?utf-8?B?VEdCM3NqZHlUVWFuWmFaWTh3UFVVTHZWV3R3MytucnpadW10TkRjeFRmdndM?=
 =?utf-8?B?bzBDWit3aWxQNHN1U0czRktmZUZQWEJmcmhZeDllWlBHTEhxRUd1b2JCVzMx?=
 =?utf-8?B?YzNueDF3eGdKS3RFbmQ5cVBLOFd1SVMvSEFtVXRJQ1p6MVhQUE8raGtLWWFr?=
 =?utf-8?B?MitLdnFBbkcxTU9CWEZpcWJNWTdyMmRpNkVVMXlnaGdOWTdXdnowbTRocVM1?=
 =?utf-8?Q?0KtXDC/ilX2S3ko4JtdmsPM=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7496420a-dbc7-4f75-5893-08dc52faa2b2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 09:52:40.6398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D5XAqbVmmIel7HGxiJDvlXr4MBNnntl6+OTRhbUVTn0N0K2LCFiD3VfdFHulBpYBqUVPAN9ZRhdmyN0dlWZOudDgLSZwQjqBT4CoPZZYj0Qq/MR5eC7iDEJ2WJAqnq82
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7251
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 02 Apr 2024 09:52:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5041

Hi Michael,

On 3/30/24 17:24, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

Reviewed-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Cheers,
Quentin

