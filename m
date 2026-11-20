Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.865.1795196345434105906
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Nov 2026 09:39:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=cfWserZo;
 spf=pass (domain: cherry.de, ip: 52.101.70.66, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m0n5f+wjG2ME2kfaPiOj6528IDPDznR91WAeVZSBfu+vpQ47XTX4aaBf9U2sazXROszBpBhWSKOgAhEx77e7KDjIolVEKkr/cqEP/LmS2AVttwEy43wvZqCbs3HJtMKds/e0lWDSWecBVbK09Ly13j7CeJR55EfvwHO6rBOjKmsv9QqgO5uoJvBBN1iU4fC884vQ2uW65x7buUFs+HLpylaO8KodDD62ETwJEw37uf8Okub+1H5fLpaSuGIsvDwtvJCdira41W2zmOtD+vUz5jlqAPrjOxnWi7xLV2CpVBgvwYeAc10JgGrx0+3i6r13p0CxG6UNyMC1UODWirigSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/GE47xzUDh7LVo5iWzuisMwnq3b2S0XYONRE06kgrQs=;
 b=kKeDZSGM1HFbUCstRzwXkU1GLSSHUuMnHf+5mlAnrrM0H4ydv/kflNWgP7TocdqAo/PUdwxZwwrERmvM/76bT+DUAwNdufIWjSi+Xmwih6SvwNDsQpytcwrNuK472Ef7jzENp+0nxId00jDv1FemopDQgH9/VkiSQZdkAe7hGEmEAWYEOaBwmuU+y6ubOxuwCCKZYrA3IEpVgrH0LQAD7ESOyHr9eXtgIHQpeZUNU6xksKAdmqV0hwqISs+6t9iIzb/g6hGHdnfyzSt2ebjF1Mv/wczDGLY4Daz8EjE80Jj2xieGUwpGgi90fp9eElKMjaeyrXO3whbVEFzqIgPk2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/GE47xzUDh7LVo5iWzuisMwnq3b2S0XYONRE06kgrQs=;
 b=cfWserZoXMkS0SmcEgYQBDZb9h9BK4RTLtyRfHv0f9ng/Ky+uclY7hBUWQ+Ewh9Z1tj+4dUX1/SZIoO5dsvUz20oOXG96SMChOrZbzu64AaS1Av2xbiJAcB2p6J1Vz43L3d6r30h1SevHAbY76GytTXQPdzNhRhivICrtiIhgBo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by DU2PR04MB8679.eurprd04.prod.outlook.com
 (2603:10a6:10:2de::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 17:39:01 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::c859:7e6d:9345:afe1]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::c859:7e6d:9345:afe1%6]) with mapi id 15.21.0639.010; Fri, 20 Nov 2026
 17:39:01 +0000
Message-ID: <5704ab71-2ea0-4557-af95-f4a59129178d@cherry.de>
Date: Fri, 20 Nov 2026 18:39:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 5/8] Makefile: use splithtml tag for html target
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20261028-tags-v1-0-d5ad01019eae@bootlin.com>
 <20261028-tags-v1-5-d5ad01019eae@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20261028-tags-v1-5-d5ad01019eae@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0239.eurprd08.prod.outlook.com
 (2603:10a6:802:15::48) To VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14)
Return-Path: quentin.schulz@cherry.de
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI2PR04MB11147:EE_|DU2PR04MB8679:EE_
X-MS-Office365-Filtering-Correlation-Id: 30f58624-0426-4137-05cb-08df472d29f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|18002099003|22082099003|3023799007|11063799006|5023799004|56012099006|4143699003|261021121427099003|261102123227099003|261022075727099003|261026121527099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info: perHhUbyAKqFmBKg0VwWIZKZARebqjs3vam6Hzx02jfBdAQoM3c9Um5rK/xdHPM+DbhXWL3XBAE5hULebJMiPjUFb+4BTpu2GVU2DMBThUVYlwZ0lQq+XUmiSWcSecVdV9j5MVJG37isI38lDAk9Dlga+qeY15FuwgNvrfnl2YW49ebdtz+3ZYC0LcUixxlh1mvkoe+22kx4f5PvY2tWH6p2YoPnmFlxHowGuQm6NAb/LK56jzYI6ttHiKpWXOwm+6DXTZw6+/y5xtkE7Bvh8/eAs4SJRVjIqTemknsqPhYd324DnChVFws7z1hyAudIvZO+XfUcZ2zgtnxdmcMD5xMFLx3f0zxZsz6q0WbInbiJaJTx+lc4rvEKyUpxx+kvnu9MAQSnNSmpAB+0zbuz2jbsu6n534soZVq5874gjzP/ZJee7dcL/0bwG2yLa7jp/fvfiij2OSvftQNS36vnoMmC92uPFOVzOh6Mn8aY+txz+Ia7+K+loqLE2vzVysAiRwOb/F3cQOBXwBla1EsFsIJuPH10JX04OJJL+hHqW5POUpOEPBwgxIDurzxUnVbGLN1bws/wffKI7km4QGVRijIwMBNZg/AAq1sVYMT3g4OyNHcukhvPB+HmzdE1mLYE
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(22082099003)(3023799007)(11063799006)(5023799004)(56012099006)(4143699003)(261021121427099003)(261102123227099003)(261022075727099003)(261026121527099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHBMZDJZSVFrNUtta0h0V1lYV0RGalZtZWZ0ZnBwdi9XRnhNK1NWUnZTWTBP?=
 =?utf-8?B?cVNYeXVVWm14cEEwUWhqVCs1M29hS1JCUWt4MXZWN1lLL3ZINEZCOTZNcVpQ?=
 =?utf-8?B?RFNQWDB2S2d2MjRRMENNRFUrK1lTSnZyOEljOUtKbm02VHJjUkN1TTNHWlhC?=
 =?utf-8?B?Y2tvQkdhMUhaaDF6TmNnUTI5Q2lsd1NQTFVaWE1mS1NGQ2ZETVFzNWFyM0ZO?=
 =?utf-8?B?b0E4SHhBYk1YL0VOM2V3bWIrUFVlSytEcWFEcUQwdi9qRWNQSW8vZ2RSNnV1?=
 =?utf-8?B?QUtSK2IyS25lbGdlSHF3anlKNERWNlR4b001UXI5c1RrSGYwc21KVVJndmo0?=
 =?utf-8?B?VWRvVjc3RGQ2eEhXRVQ2UDFLa25hYXR2eFN6VVB6aHR4enFuMEhodG9hd2d0?=
 =?utf-8?B?ajBkc3FJVmFFRDR6akRKdktjMG1TKzJKUlBiMndxdlJKTVM1QkNJVTRSVmZS?=
 =?utf-8?B?MEtEb1NMYTc5eFZWMCtSbUorWjZYWVdxSW9mc3UvWWVLRlQ5bk9ZU0dqWFkw?=
 =?utf-8?B?b3FlcXowbVdEcy9UMXM1L3RURDQxTE5USGw4ditUN2hHRXVsWXduOElySGJx?=
 =?utf-8?B?MnFZT2FpN3lZaEo0T29DVlg2YzBaaWN6K0x3WXJSK0p5ZnFKY3FLVVhoQ0lN?=
 =?utf-8?B?czFiOFFOeFZGeTJkWFZpS1ROcVNYdEVDQkt0bDlTbzI2UDRLRmhjSTRQVlNZ?=
 =?utf-8?B?dElXRFhkdkcwYUtKcU5lRyttSkJPVGlpQW8rc1lkUU55RE1mVDVDK25iaFM3?=
 =?utf-8?B?aUhmMVNSb0Qwd2c4R0pvNnR1WXlaa2FpcjNkQktEMnppYmt0czBpYXc5bG5C?=
 =?utf-8?B?TjJsTklUVlRRdFB3dXdyMXAxd1NkTU9PRllFREd1NkdzREZ2SXRja1pubis1?=
 =?utf-8?B?emRSQUl1ZlJteHZYcnAvT2hZdGlrbTVCRDRENlIrYktuNEdFdGdoeFgwTDV2?=
 =?utf-8?B?RGJhUUxqaHUxUjR6MzFIYXh3MDVoY29uNnVMWXlodjVWei9YZFNuamdmU2Zn?=
 =?utf-8?B?VVA1cHgwdEVFbm03cU53MG9YaXJIN1dBZCtUQmh1VzFHYmx2ZDNSRzhWYXBW?=
 =?utf-8?B?bG1ab2VpYjMxK0RkSmt1dHl1dXE4YUsyZVM4TkFWa1luRXRnUUkySms5eGts?=
 =?utf-8?B?cExTaWZHU3plTENKMTVKQ0F4WW1pMEVWTWNsYWtZMUU2MGFJZXJOdmpQdnhX?=
 =?utf-8?B?T0JWeVlXT29rUTdwRG5CSVZXZWFHVUR4VTNkK3N5ZzdYakF1T3A0UzMwZkRY?=
 =?utf-8?B?dmh1YUFOeVhKblNBbXJHMEpscWZLbmh2dUk2dVY2T2NGUTJVbHdMODBsN0th?=
 =?utf-8?B?VXQ2NFB6a2dWd29SY0FlZFNBMkJUcUUzZXovenlBenk4MVBURjkraHlpbGtU?=
 =?utf-8?B?MHYvVjhSSjEyTW80UmNsSmYvOXBJYkIyVHhzSWRPM1lrR0dxbVY4WXR2OXZq?=
 =?utf-8?B?dDF1bUZJQW5TbjFaMWdqamtMRjF5U1VJYzlxSXpqWElxamY1anZWOUxzeU1V?=
 =?utf-8?B?Um5TNVdpZkVUajlJMVlxREovaGxtQk1OY2xJUTBYckQydVhXa0U5WWg4dG54?=
 =?utf-8?B?TnJ3SDdKcmlQME16emJVK0cveUtYWEVuRVd0bC9KSHMza3hKdzNoSEozMitJ?=
 =?utf-8?B?T2hlNjd1dWJWK1NmY3M1T29UNGxQb0o5eW5rUjhWWlJkM0hRSG5DR21DY3Mz?=
 =?utf-8?B?dElEa3BrRWlIYjBNMkIyVDJGaUVRTU1uaWZIYzZITks2WGNhQXlvT0ZWMnl3?=
 =?utf-8?B?bHRhN2tPZHYxSUw1OXplbUZBS2oza3R1ZkpBQTQ5RFdRWjZ0a1ZPMmx4dlhM?=
 =?utf-8?B?dDRLNCt4VlFDTG9BcVBRK3J3UUlPZXZJMXp0ZVh0OHVNaTM3Y0J4YUpIOGto?=
 =?utf-8?B?bUdBK0Fpb2NXR3R4MjRjNUNZcTdVTlhXeVhBcU9QWGNJdGF2T3dsZzZQS2N2?=
 =?utf-8?B?NWRBbllMOURmdkNKRklNMzJzMXpRcXI0L2t4NVpjUm9EYnE0Rmo0TVBQVW1a?=
 =?utf-8?B?Nkp5MFpJalgrVGVuWXYxSk1JUkg5bk42VlN5MXIxNUwwYVRuUmNTMC9KaTly?=
 =?utf-8?B?VkZkTjlyNHhlL1pLYkxtZVJQeXpWUldEelRKRkkvc1NHZU1JYnNuSTJvaGVM?=
 =?utf-8?B?LzdSaWNqNUhYMEk3VE9TaGRYQTlHQnBkN2s5dGJoaGcrN29QWGZ4QUJKQzM3?=
 =?utf-8?B?N2ZVZUhkK213M05YOFJRVlE5ODI0M2dCc3JzYWY1ZEFWVlBBbnhvWGIydy82?=
 =?utf-8?B?TE5ENStCbjRiQXdiMVR1UTUzYmdNaEVGeFlEeGtaRlpvZ2J3NXoxNi9Ja0VZ?=
 =?utf-8?B?NTUxb1AzbjJ5ZEFsU2xSSC9PL1NsSnpYR0t4NDVsZytlT2hUbExCdz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 30f58624-0426-4137-05cb-08df472d29f7
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11147.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 17:39:01.4168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iKnb2U3xVWTV1jqnN6VfIqpapa0cz34SX5I1Gqw0rsWZlTRYHYJHPwtnJJhimmpFnjsGf8jv/uDuCFy6McepFSdPJKKEdjtQDESCkYePs+k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8679
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Fri, 20 Nov 2026 17:39:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10821

Hi Antonin,

On 10/28/26 9:04 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Sphinx has the ability to include content based on tags in the
> documentation with the '.. only::' directive. As '.. only:: html' is
> common to _all_ HTML-based documents (html, singlehtml, epub), there was
> no way to differentiate the split HTML build from the others.
> 
> For that reason, add the splithtml tag when building it. The goal is be
> able to to include content _only_ for this build type.
> 

question: what's splithtml?

Just reading it, I have no clue what it means? EDIT: ok, after reading 
it twice, I understand you meant split as opposed to singlehtml.

builders actually already set a tag, c.f. 
https://www.sphinx-doc.org/en/master/usage/restructuredtext/directives.html#directive-only 
so you could simply use

.. only:: builder_html

The benefit is no new Makefile rule :)

What do you think?

Cheers,
Quentin
