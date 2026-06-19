Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1DFFCD98F2
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 14:53:05 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44206.1781880785247403612
 for <docs@lists.yoctoproject.org>;
 Fri, 19 Jun 2026 07:53:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=WlvK0pvr;
 spf=pass (domain: cherry.de, ip: 40.107.159.49, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TUtKFph5UiM65Xfb1UrEtUrGPBZiwliNpLykcehS5cenMcow4QeCUiitQQnGh5cqxuTPIMLDvvSMfofIMX49U4b/5b8TH4HeTPUKijE6lABxLy8QY0Lzt0ArLOqRHGvmisnWYF1rY6BI76u8TfEqOhByzFptr0/aCw9dkjFK+PTll5k/RGBxOHwZ6NbyaJvb+Xzskc/Zxrox0+fGp2YVK+UGjByGHnEyoiLL7PhTfmFIJ0bUls98Tv9nloB+BycPXILa1e+OquzN9sm1z1Y8m8NLCv++dRfDOy+vyzvzR9Lxbao3Btw/JkuJrZzA/ird5rsvuM9xl1s72MnEuMzJMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j6LRewgtwckheJ8M7EYlRLGSk/rkb8kTEJJG0euA4WI=;
 b=GJi5tvwpvjZR8pY+uol9DmCi68R8/gEqNCRER5lu+eR1PBawkly3LKeTmXB9JXg81T7NgZCRkcVA6LJteUPvc4qNkwx0/miZQ7Xrk4JbWbJ70eOdPa0ZXeAEV7lgInepyco2eh7qXcOfeMai5RawK44Aa4UD+2BwP/THFkN1XlhWfwH64Xp3rEHTh6uJdDZ/E5oKGHoYgbZiuteL7EWZ5MHFiKOSe3KNgqv9u43/Nd38ar9PSFaHETUo58wbWkKkTPDNxygytfL1fIqMXl0fEUA/YTMKIHdl4d1iLJC/HyecHVbjUqneeAdg05zE69Jkl/6NfpeHgY8KLSPO5v1HvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j6LRewgtwckheJ8M7EYlRLGSk/rkb8kTEJJG0euA4WI=;
 b=WlvK0pvr/cUhFHB+Cy8o9FaIWuSGnOZV7ywQNX8nNKzLm7hnnGWNkS6FsqOzdXHKxinPk+szaeXsTMPKeOe5EfYkj3aRzulCVr7oz89SihLRh17iYQTBu0GZMBKbsigHb/+Py8LSxnABwj7OHTjrfNR9VQLiJ3dyM8HG+R1QVes=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20)
 by VI2PR04MB10219.eurprd04.prod.outlook.com (2603:10a6:800:22c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 14:52:58 +0000
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7]) by PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7%6]) with mapi id 15.21.0071.010; Fri, 19 Jun 2026
 14:52:58 +0000
Message-ID: <5533702c-804c-4c27-8ba5-5e55cff83d1a@cherry.de>
Date: Fri, 19 Jun 2026 16:52:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] migration-guide: Fix migration scripts
To: uvv.mail@gmail.com, docs@lists.yoctoproject.org
References: <20260611073236.879823-1-uvv.mail@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260611073236.879823-1-uvv.mail@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0177.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::14) To PA4PR04MB7743.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7743:EE_|VI2PR04MB10219:EE_
X-MS-Office365-Filtering-Correlation-Id: 038ff1c0-e7fa-4664-29de-08dece1273fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|56012099006|11063799006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Ed7D19S2PWKTdzeaXxXE7aErqM3mE2u12vbFh8LpIgvs+QRGUFqWWwBxer4qWaDt3GgzlqqELQppJRqeporfr9gDqvzerD9SREbRTkI6MQWsOqnpZUZY4HM0hhQCPW6O5u9YfxCwsGftC5/TCyQbMoO7uII1rAeqZhZOrGRoSQvYQjBOE22i4a/fFj/jO0C/kIDxz0OMYqQesaHLKe0clDd0ZO6jAHzbr5/aHNdmjn4Po1xEva+C5UomH7hlhrqbt6BmCE9KZ0nnZ1ZXkRLYYb0OijyXZRusZklp9qrcxvUwCgmAoaRedI89bLkxjgJL+n/DE6rel8VsT/Pk3wR5LNBj85RS3ak4NVYx1V49rZf9Q/De/QMhkuZMGBk7emn2984xAanXRaQRPdwzWl6BIom4qtPcJcd13QeAy44PVDQPOTqOFHsu4aPJaXBihsIZIXsEYh4E343eGbCMMgU0B8LhhhyVg/kgQeFLOcbnNHD0fbkPp6W0xw6uO7IYQ/PBhlgr7R4x9qthynXhYLNm/wsnrjxfG9FPgI/2T08CmPC2A0j+1iCqn4ZeZu9TcPQOeG4fMhUbZoiF1HPCGxmoImzvl4gjhi6GkPEDuq1hAGPtAnA1u/I+qAA+5Som0Nd1WS/Fa3hzxpUmJvlhWAK4ASZKF+1xkfWZ03kMtjf1fkQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7743.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NytTVDZXaUw4WXdrdXRCSnhUYW82bmxMUVNJTkZoNHhta0ZtYzF6ZSt5SS9H?=
 =?utf-8?B?eVUwL1JUZnBGaVJiUFh2VHFoZXVWQTJ4a2hhcnJSMTRVajdVQnN0U2ZSWE12?=
 =?utf-8?B?TzdkTnQvazliL1hZNW1UZDBHdDl2SjAydEpKcU9yYU1PazZLN3FDTDZVa3Ba?=
 =?utf-8?B?eEE3T0lCNDdIRlpESSt6MExWbmpnZnp2aWdDODNvb003U2I5VE40blBldUFy?=
 =?utf-8?B?cVdGZzgzUWpJUG1xNDJDM1FFMVE0UDd5YkVOd0FudmN6a283QTFqQk9yNUhz?=
 =?utf-8?B?b3JBQXg3RzlUK3VRTlZ5UTdQQVQ3K3BCVEdEeE9Xb2hTRnBYaVlPK1c5WUQ0?=
 =?utf-8?B?Qi9IUDFhRUE5d1VOelJFTmZsRWdkMkRtcFVNV2JFSU1Qc3JRZVRpVFFNWUUv?=
 =?utf-8?B?SzZzL2Q2QW1vSCtScUVyWlZtR0NTMWhoeCtIdElkUitzRHV5L25rM2c2TzFP?=
 =?utf-8?B?OVFqSTVYMTZjdEsxb3lvWG1xZW1CdWZ5Zy8vN3YrKzV5Qml1WFYyeVYvQmt6?=
 =?utf-8?B?ckp5Q2FXSkZKZGhhVHpBVWhVNDJCTWRLNG4wSzVWczVRMk5sSWNXbWNDWlUv?=
 =?utf-8?B?U2E3UnV3VGtkbFo2TlFLazR4ajhRR0pyTi8zb1ZDaWFxYmU5RGwrQ0dxeStw?=
 =?utf-8?B?NDJyaHI3KzdQTGFCQW9FSXRmbkFzZ3MrUDYydUF5cW1nWlppUE5XdFFiNW1q?=
 =?utf-8?B?dXgwREZGd1F2UWFDb25iV2lMdWVEV3l5aEJDKytROGpjdFZUN2VlUjF5ME00?=
 =?utf-8?B?b1U5SitSaW5VNGc3Tlc2ZHk3d1JYc0tFdDRYc2xUSWRSWTd1N2NNM3NBamRp?=
 =?utf-8?B?REJkVnZ0bFhXNmxSK1ZhWUFINmZuQ3JFSzVtOTI4N3lFVSs4WThLajIzbkd1?=
 =?utf-8?B?SlZXVzRZZ3pmNjdMVWE4ZjdqYXN0WmNnc0t3c1R1TStEYXI0bEdETWhONFJY?=
 =?utf-8?B?STY1Z3J2aktnc2FjUVU4bjVIdjBjMVhvcWhKeS91VFpWQmtVZGdvL1FZSkhm?=
 =?utf-8?B?VFZjQTBYMHJLMmtQVGFCT1l2M1ZBTzIvdmRvbDkvTlE2WEViNGt5MlFud2lu?=
 =?utf-8?B?WkJ5aFRUalAwWkhUaXRGVCtmZG1MZDJ0dnlDOXlPb05RaE1uS2x3K25hZjIz?=
 =?utf-8?B?VHVZNjM4MmFuc2pHS0xXSGk3bVRxbjNrVmQ4MDJERis3ekFMWHJlRTh5UUoy?=
 =?utf-8?B?MWZEVE44aSt4SkR1NXlhZ25IeUZyQkRNYTVKQXdBRk9TVGtxYk4zdC9RTmt5?=
 =?utf-8?B?Y01Jc1BlaFZ2Z2k5Q2xtU1V4MzN5UGxoRTB5T2NkWHd1MlpHakx0eC9kYmIx?=
 =?utf-8?B?emhKUFduYmova1hXVE1BWlFVSDZ2YXh5dW1QOFVmT0FNUUJ3dG5DUm9ueTJT?=
 =?utf-8?B?VldMVzJ3REdDN3lDNStWVnlYV1NkMjJ4ZFVtWk1nK2RFdkxNWG00TEtHK2FL?=
 =?utf-8?B?bGRyUE9nVWVxUk9JMGgvbGVKd09KVjdrdnhIaXdyNnNENStiMFpaL0NrLzAv?=
 =?utf-8?B?MWxwTFVaYW9SMlVhRXRjckJ1SzlqUlcxZHNTTG9lODh4cndGaWw1WG1SNTFj?=
 =?utf-8?B?N2RJWlpWdndlK3MwNDVCekdPcDU1UGhERTVWcE1kVmUyMnkyb3pOd0pRajRm?=
 =?utf-8?B?dFhsdnIrVnJKdjgvTVZBcWxPVGZtY3BOY05oWWFvRm5wbW9XN2RFSERpWlRs?=
 =?utf-8?B?anZTTVNRdHpVUmF0MUQyZVNaUlVGWU45UDVoTWl3bVk3bDkrTWdLNG43cWhW?=
 =?utf-8?B?eE5rbkhPMG9maURWNHdlSHRaQ1U5NEFIdzZ4YjZUd3N6bUtQN3V6QVQzTGNu?=
 =?utf-8?B?elA0S2kzTTRucnJoTU1sbXdlUFR6RVZ5YVkwN2diM0c4YVNOQjdyejRVWEVx?=
 =?utf-8?B?MXJOZ0JCSW5WNUUvMlpCTkF0N0xmRTlJSGduL29UQUk5RTlGVE1PT0YvSG5O?=
 =?utf-8?B?RnRjcEV5MXVnMjhjeitKZnhyVUM4QUhKMVFlTG9veU5TdE9hZHIrdzg4MCts?=
 =?utf-8?B?Ymh0OTAvczVkNE85aFJXTGxiZWU4U0pSUjltM3ArV05TYXNFcWtGOXpEZFFQ?=
 =?utf-8?B?bHBWdytlZmtkVms5YnNkR3BMS1pwYnpsUGJtYVExc2MzdEt3S0RwN1I3MXQ1?=
 =?utf-8?B?N1ZJSHR0RTUvcStpSFBJeDFjOHA4R1pTbUtHMFlyMUN4MGlPeXlaU2ZzWmRS?=
 =?utf-8?B?UXZ2OHhYRXBaK3NxR08rMkpFamVNazBWdUh2aDZPdEl5YktmUmo0cFV1bHpT?=
 =?utf-8?B?bUNtb2d5S0RqYnJDWWwrK25xNURMbzVhMkdvdjJjbEY3MCtmdDJmM2x4Witu?=
 =?utf-8?B?Q1krNTlaVERmVUNWWk9ZZG43d28xS1RVZmlvSDFpSlpRVXJPMWluZz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 038ff1c0-e7fa-4664-29de-08dece1273fb
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 14:52:58.5017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5UXrrWVJsg/Eb8hLRgI7LOB9Y/VVBLlqacviuZQYyDBiQ+759A0yRQfJK4AyHdH6eWNh41oe4Aj0PrGXIENeRGEO2O4KOfuoodJp/Uw/Jkc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10219
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 19 Jun 2026 14:53:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9792

Hi Vyacheslav,

On 6/11/26 9:32 AM, Vyacheslav Yurkov via lists.yoctoproject.org wrote:
> [You don't often get email from uvv.mail=gmail.com@lists.yoctoproject.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> From: Vyacheslav Yurkov <uvv.mail@gmail.com>
> 
> The names in the find command should be in quotes, otherwise the
> expansion is done before the find command executed.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

@Antonin, it would be nice to backport this to Wrynose as well.

Thanks!
Quentin

