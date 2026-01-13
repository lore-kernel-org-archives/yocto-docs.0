Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1693D2D10F
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 14:23:42 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.60143.1768314219684078053
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 06:23:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=SAby+1fQ;
 spf=pass (domain: cherry.de, ip: 40.107.159.23, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K4rXfoWmtGF7+VE8SsSZR+neeI9r4EDbD1mIQmHnHM1368x8t3m2d2Qb+fFJhCkhHCna1rI3N5b7w85aZKFYYM11udMyCcPfjGYcytTNqfy5+1ROoFo1BvULdlcmkIIbVnY5gMYuxTm348xsdLdndt/NINlnQi8LKl+kLSEzOBb3OhMS5psoVnW+Vv3fkWL12EaXqi/Vb6Juw9D0nBSevUX69KxTn/Z/9ubQ7qDfrnAEev4y/s7XZ79yr6VpWWt5zA62X77Mf68+VONkr1UOl0mobosOy9h+Ec+dKSS9HZd1HDTZW59kCe3M0uUe3IA08THHJxtGBYfLOFF8TJOiDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZIaERLuAu97pjTYuoQgnauT0WZi+H1uIlpQWGP3C+iU=;
 b=tQGEAy/cfGsi/42wnF/KSwFN3d6p/3OARx0RZYNG5uyXisg+GVZ0AFaEfe1BA3gTTmMQvK5+RipY2or6FDjDIHXPzt6qBQMvU9rGNrwBKr3X5JAVgqHZzsiaA/CWzD3uuUj+Ln+jeb+fKv9kRd7EydHNNeCZexYHpbQvXd7qmp2heN+KdpwQ0zmq67+3eKdv0dImfhkzp8sEK0EiQd54ec8mF8tsACoUXN6xOLgti8eSMtjevZKgiWtLz5Jsmr9OkzVp691nXkvXkenAw3r6mI2AOkdDnQTH9IaT/l8dD9if7x+RVl7jZFrSY3SWsLP58UTh+vTlGzfZh7IcpCkAhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZIaERLuAu97pjTYuoQgnauT0WZi+H1uIlpQWGP3C+iU=;
 b=SAby+1fQaNbqZhCU3mxf8YjVhX2hQkYw2Roytwgj7essnThWtnzdnYWJ6yLRSWMzOXf5qD0EPuCi2IS/2qzT7kC3njHaLnCQBpKlWzTptpaqomPlKs7iKRTpdP07cxGIhC/OXfgFr4Zq5/WA3Z9WEVieyofNNH/pqBBOcQwPMJo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DU4PR04MB11364.eurprd04.prod.outlook.com (2603:10a6:10:5d7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Tue, 13 Jan
 2026 14:23:35 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 14:23:35 +0000
Message-ID: <e22a5a3c-2109-4aaf-9de7-1ef931babc72@cherry.de>
Date: Tue, 13 Jan 2026 15:23:32 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 29/53] sdk-manual/appendix-obtain.rst: remove
 obsolete poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
 <20251224-remove-poky-references-v1-29-658a5f4dbde2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251224-remove-poky-references-v1-29-658a5f4dbde2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0002.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::7) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DU4PR04MB11364:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ce6ae40-d49e-4f87-88ec-08de52af5641
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NTJNWkJTcit5SGlFTUtWV1lHUm01dGMxYzBXWUp0aUdhaERhU1YwajBrOFNI?=
 =?utf-8?B?MnFKY0VzZEQ2NTRCczZDSE5xbVkwb1ZoTVh4dUR2c2kwUE9RWEQ0SXg3Vm9C?=
 =?utf-8?B?bFViRTZhNXQyYUc0SmMxRVBjOFgwMFdGSXRzazdHeUZHSnR2MVRDOEhZek9p?=
 =?utf-8?B?RkozK0IreXova1hnVjFOblJ3QXhQOU8ySThMTWNpdEc3TjF0eXlEL0ZMbzdS?=
 =?utf-8?B?elpXTHR5eEtBUmhxNEVYNHFyT0tpUTRnNGlkRjlSZE5udDZlcDMremJ4bjBk?=
 =?utf-8?B?ZVdUK2RWNkJySHFkc09WcGFUQzlGTlpwVjhPVXdVVE9zNlc5M2E5STFmUUt1?=
 =?utf-8?B?NzZDbDN0VmRiam44aTFYUUJUUUFjeC96eWNRT0FiRXdLTllqNHVWZjYxcnVF?=
 =?utf-8?B?MmdMbGhDVFcwV1gyekI0ejBXUjJUUHNsRGsySjBNNThRU1pIUlNkZnFLWFZE?=
 =?utf-8?B?U1VybDZFU20rbStSbnQ0bzd5KzNyWlFZLzU0T3JjQ0V4V3lXUWZIVGFFVHhk?=
 =?utf-8?B?QkxlYjJ0TUFpTjZocUprckxOem9CRVlDa3BwUkt5KzQ4RkEwY0lIcXFpck5o?=
 =?utf-8?B?RzBidnErYkJyL2NzcUVZR2ZYc1BxeFJCR2c0RmRjYVZNYjdXeEFQMXhabjlU?=
 =?utf-8?B?dzA0cmRFQ3l1emV2amVzZExtNXhnRktTVmZ4V0ZPbWNwZVVIZ3Y4QVl1b1lm?=
 =?utf-8?B?cGhucEk1aUI4cHdXRks3bUxOQUdBU2hPcmtNTzh6NmZtUmFNTnEvRDJWRTcz?=
 =?utf-8?B?WCtJcW5JbHpIQkV5TmpWSzhJSzRqSGFtcG9YYmcwdmhVOUNxTVpOVDFtNG54?=
 =?utf-8?B?TXpkWExtNzMwZFdKNjFJaDFaZ0VReUk4b3RxTXEraXhXZDZkd242WEtMdlUy?=
 =?utf-8?B?Y21YR2UxS2p3UUp4eVhHc1d5V1krNkRUUnBlNjNDczBCMnZoUi9sT3RYOUli?=
 =?utf-8?B?dXhsZjI1enhWays4aFR4NWZiWXFpbmt6eHFhVmUxckE4YnkvM3BZY2xoSXR6?=
 =?utf-8?B?SVk2S0lTaUJCb0hVK2I0VTY5czF0djJBclJsKzRIUlhHOHp6NUNPQXNhQUVP?=
 =?utf-8?B?Yjc5dXBuTklmQkt3dE41RlZJMWxtUFh1K2pDQnRLSVZzUkRkRWF1QW40ZkZ4?=
 =?utf-8?B?TXEvbHVEaCt4R1lKY2JoKzJ3Z1BBd3dnRFBYRk1NZXhxOXNFNElIUGNydTdJ?=
 =?utf-8?B?TGtHMDFMU01KdHF2OTRPODV1Z1p6SHBtY25VeitNMkNOUzIwNFRscjlFWmpr?=
 =?utf-8?B?OFA0NmhrNGpzRmVwaURsV3I0aVpVaUpjVGlPRlZrK2ZybGRrOTBNUFBUSEhi?=
 =?utf-8?B?SDF5ZUtKY1RtdndaSlRQQXhXbm1QbFd0WmE4d3NEdFNEekxYdGkxMHVRS24r?=
 =?utf-8?B?ejNKM3JTSEJ3UFpWL3hVbHhMcmpTQ2lHZmF2QklVNlkyaUczYVZxSGFveHRR?=
 =?utf-8?B?b1MzeWw5WUk4Vk1hQ2lMek1iVDRLeUc0QTdUV2ZaQnM1YmwybkdJa2crMFZH?=
 =?utf-8?B?Nk9CNDBvcVMvbEMwcG54SS8zSE92WWFTVXJyQmhSQlFNdGhZOTRqNWhDVEJC?=
 =?utf-8?B?bTdsMnl2by96ZjFKa3E3UW8vcGxXQ3I3L1N2ZkkrVU1SQlAzdTN4US9BMmZi?=
 =?utf-8?B?SXJxZUx6WE5XdGZEV09NUHZwa0FYTy9POTZ2Q0RNMmRRdytMamU4ZStiVTJH?=
 =?utf-8?B?ejN0OWlvL0tSVmt1YzgxVW43eXN2UW9ZUC9MSERCenlEYmxTWVVMUGhBQlU0?=
 =?utf-8?B?N1hPQzU4cU5RZjBOOGV6aGw3cFBKanBpeHZFcVlSb0MyN1V6Nm14S0swYWRy?=
 =?utf-8?B?YlYvY1V6eU9UVnptM04yb3dPM2J5bmp2UlZnV0I3TmhiMVBuSUJNOXBzaHBR?=
 =?utf-8?B?bjR5ZmxpVkdhOEIvdU8vSWxJcVliQlNsUHRkOTZhc3dnV1dReURXSHRhKzU5?=
 =?utf-8?Q?W1/YjD4k4SSSECUYisqg35xAQh9Ssqeh?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?a1dXNmlHdndBL2R6VEx4bHFFQ1JkSEJwN1FmbXI2TEtRUGo5QXhVRHNTaEZj?=
 =?utf-8?B?bEVYM2dSeDcwdklTQk00THNEUGlVNHdEVnJUOHhNRjV2TDhtN0V5TXJuODMx?=
 =?utf-8?B?VXYwS2pCOVN1d3VVYnpQQm5kY2tXOFFHdkcranpzYUR0enVKZ2JlRkhIM2Zn?=
 =?utf-8?B?NTdLTnh0NW40dURaUzNaN3VZMlJoTEZtMHl1alg0cWNKc1FWamNuYmc2bDhJ?=
 =?utf-8?B?Tmw3U2krcWljeTVFNUlzSkJLeHVISUxaU09JemU0dkZXZWFLUTQ0c1dCY1Za?=
 =?utf-8?B?cmQ5RTRoRi9UbE9zUmg1VUR0bDlNQktRUTI3T1JzRmVyRVdmUUVQSzFINUhF?=
 =?utf-8?B?dFExVlk2cUpIK3MvTWRvTUlZQnZtbm1SN011NXl3TVFvSlJLZUY0VTJqbkNK?=
 =?utf-8?B?bjVtK200cW1RQTIvRi90RUZDdTNZL1dBSm8xYnc2R2RFeWFvM2VURWswZDVV?=
 =?utf-8?B?WC9oV3RZb1RHMklLSEtMcWxtM2dSYU0zVGdHdmR3dC9lUGRaUXE3VGZKVTJx?=
 =?utf-8?B?ekxrY29sYUFXSm5WcXNSSGFCY3JzWHFoOGJmaUZZck5LM0x2R1VCSkJpNWJ3?=
 =?utf-8?B?TFR3M2VNVnpXT3hreDR4L0dxalE0YWV0eHQyR2wvMEVuMXFOTmhPMnI5MmR2?=
 =?utf-8?B?dVVyaVBrYVE3TEJOVE5aQnN5Y2pRbW9uSXRJSkQ2cFU2bnZ2ZEtORGZNekF2?=
 =?utf-8?B?bnU2ZXBYdHJiWVJYOGF3bG4yLzhwZk5JM2ZGQ3VRL0poQjREWjVjZ2piSXJ0?=
 =?utf-8?B?bEx2Ymp0aGJwdUgyZmY4UzVGaWZkZkNFSG1QVFE3dTR6bWJHZzdkdUtKRWpF?=
 =?utf-8?B?OUtvT2FZRWNqU3ZpbDRUckR2MmJXUXN4ZGtEWU9MSktCcEV3Vk9nYmNaVGlh?=
 =?utf-8?B?ZkJpVzFXZW04Q2xuVlpUVm5uR2tkRUdaUXl3ZzFVTkYyUS9TMTFmaWxZNmV6?=
 =?utf-8?B?VndNcFFuSFZ0dHFrSk9pR0x2ZDB6bEZ3by9LTHYyVkRZMHlmZDRYeTJGbWVM?=
 =?utf-8?B?S1hZWFFlc04wWmx1NHJHbHpZQjNvMUI5MlBPNTY0d0FHZnFQU3FiUWJ0NEx3?=
 =?utf-8?B?cGx5UU5KSjIyZXpUVkZhb2o3aThHNmZVQndFeG5LZWpWM2Y4Z2ZHSFJtc2RK?=
 =?utf-8?B?c213bmgvUHFZVXdNUEFub3Z4dlp2cXlYdmFVVVhpNUVLYVNpcFRDQnBDeUxV?=
 =?utf-8?B?N1ZSWFdadWRmR2VGN2N6ckVqY2w3c2xpeloxcExnWlphVlBiamZ1QmkzaSt6?=
 =?utf-8?B?dnNUNWpIZkM2OGQ5bks1aldtdTFwcjdwb3hpWGo4QXM0N0JWYmFGTllBY0xG?=
 =?utf-8?B?OXpDekVWTzVuejl0UmZ6aGVrUlNTbm9zclAybUxkZitycjRKZXFkeEVDdFlJ?=
 =?utf-8?B?L3dQVzZhVlJtdmJuVXkyU0Ivc0d6Z1hNNk5KQTA0VzdwcUhCbHFBRXVCdndn?=
 =?utf-8?B?MXhmSzAraHQ3WS90M0dnWkFXdEU3andZckFqbXM2Q1dFOVBLRXZ5SlkwYTFo?=
 =?utf-8?B?Q2FaRk5wUDkraDZXZFRUNmJaYTVrVTRrUlVwR2RXUW1Db1lyanZRcE5GVEVU?=
 =?utf-8?B?T2k1NUthMHNGckJtT25BbHZUTVJYdnBCOEFwN09keXRLNkpSSzRZeEh4YUFa?=
 =?utf-8?B?b1NtcUlBaVltdGJXWm9lUUVJUmc5bFNqRkNwYjdmYVBqZ2JwWktESGlpRFVT?=
 =?utf-8?B?eWNONmlaUGJaU2ZJM20zYktzMzVFWVZIaWwxb01iUmJ3cklPOW5leHBkWCs3?=
 =?utf-8?B?R3h4WFBaZERUV0Z0dDhRWUd5eHpUN2JGdzR4Y0tpZ0Q5Wk5Ya1hORENkdnVn?=
 =?utf-8?B?RndydVdjeXB2Zlc1MnNSdWZHL05BSlVmK2dsRnc5L3pzRjhKa3gwcVdBNWlY?=
 =?utf-8?B?NmpGZ3RWUVNENkN0SXduZ0hxYk0wREtVajlVNmxjQkxzSGN3RCt0Yi9qaXc0?=
 =?utf-8?B?L3A2LzRtVGhDQlRNalVnaDdEcTZmZTNMUEx5WXIreEE5Nk1TM3lFOUZ4VFFo?=
 =?utf-8?B?OVY0Wm12aytiM0JoVnRPdTlIVDJVTS8vaDNucUt1OVBadW9hWWpydUxXNFVR?=
 =?utf-8?B?MmhnRW5DeWp2L0xNc0Z6eE9XaFVzZTM2QUlYcWVsVkdFODhCTDhja2NuNXUv?=
 =?utf-8?B?MHBxR09XR2c0NzN0eFovTUhVRlFiN0swcHprQWJkemxCYVZyYWhxaElqNnpx?=
 =?utf-8?B?VTA5aTY1V2ZLUkNNNTFIb0h2WFFrYlROZEtaL3FRSzRkVVRPZmNIdElGR3Fv?=
 =?utf-8?B?T3pWMW1KS0ptUndnTXpwcU5zenZEN09SZk4zenFra2pXNkNxNlg0UHRqVGNO?=
 =?utf-8?B?Qjd1YTdRQnFTakZkMVRqaDl1RmhBVVlrSzVheWluNFBoQ0Q4YTBlZz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ce6ae40-d49e-4f87-88ec-08de52af5641
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 14:23:35.4551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4EMwuh48S2vDhcq6vIWxEY/eXgoh7hXjGC0cXyyge74nlMECVZEIQsXBo+YWuNmNVVPAt4Jd+HFjyFUNdTkSnlorl96FbYg+ynR+COEk/Zs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11364
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 14:23:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8518

Hi Antonin,

On 12/24/25 5:31 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Rename the source directory to project, as specified in its new
> definition in terms.rst.
> 

Not sure about "project", but that's nitpicking, so

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

