Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 973F7C87FCA
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 10:49:57 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.2])
 by mx.groups.io with SMTP id smtpd.web11.84697.1754045395564436975
 for <docs@lists.yoctoproject.org>;
 Fri, 01 Aug 2025 03:49:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=OJqrzr8w;
 spf=pass (domain: cherry.de, ip: 52.101.65.2, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tjR+REkveIYeJXDvaju7EP9GcFgUAIrpOyA9y/igZwBmtmF9oxeFlbgtoYfzpFQcAqu1GwLqTsS7rMv91ohXCXNyIlWubOWuBzwDzsflWaebVh0b8cAFKzhW9+GugfYyF9Siihr/8D91Ra4qx57SEaqbVGh8utWHZlGpIKlkcJ44RJ25YpQougpacmZplZf47nZodIAdqrMfgfzYX9/+tfTghoR1jbEfsdlcTwL/fKGtApCcKqW51XLhXqssaQlkggzQxaijtOOBghlU6t6xyfo6RtRmhuPEb3mI8LjKiE1yTH9ivlA6N0us0j/ri7dikBtSEMxRxdSh5IlnV9g2RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hM3EqyuowSy49DUwxX0SxmWL/1yR/FzDw0AZ/aOzsow=;
 b=svtlAhbWpk83JtFDPoUJqTRjia1uCyztdPG8Agm0BcOQSEDdzNGOg44aGn2g2tImzyejThbCGfdntd9O+sWDooIo8qGLQJbbRBvMbnLj1As2BRVxMYIBQDSVp7vsk616T0ZX8myMNN8YAZ5EKTKRxRnUfuJJI0r4cpyebJmSb6nE4sKKpd8WlamtnKo5b6YSZiUdQEATJzQ4eQX6XWJuI7AH8y3uS2nRmiqv+eJLdKserPDtDwxfTaetGt4aIdffjKnRDmKmc4g+qs/LgoLh1Y9eiEojjHrleDzNxRC4/wTX97XA5IMj/GhNq/shv6cH+YISfKUMqLyCcW687PLq6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hM3EqyuowSy49DUwxX0SxmWL/1yR/FzDw0AZ/aOzsow=;
 b=OJqrzr8whwtrz5sa7hqR1YmotJNtCyaBhMidIfPHxtZHQxB/wjCi8J4mv762ELDzlqKtDO1BWmb20jPQR8tu7EWWat3TlDSZ9yYZSeYlRz2vScdMvtiFcxNZHap03h6dSCKoCLYDpAr/7r2w82ttHVIAk6A9qWxObTy2wIE2q1o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU0PR04MB9495.eurprd04.prod.outlook.com (2603:10a6:10:32f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.16; Fri, 1 Aug
 2025 10:49:53 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%4]) with mapi id 15.20.8989.015; Fri, 1 Aug 2025
 10:49:53 +0000
Message-ID: <0845868e-52cc-4c22-9a6f-95af7ba3a30d@cherry.de>
Date: Fri, 1 Aug 2025 12:49:48 +0200
User-Agent: Mozilla Thunderbird
From: Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [docs] [PATCH 2/3] ref-manual/classes.rst: drop obsolete QA
 errors
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250723-refactor-qa-checks-v1-0-3a72c751ba83@bootlin.com>
 <20250723-refactor-qa-checks-v1-2-3a72c751ba83@bootlin.com>
Content-Language: en-US
In-Reply-To: <20250723-refactor-qa-checks-v1-2-3a72c751ba83@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0116.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:34c::7) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU0PR04MB9495:EE_
X-MS-Office365-Filtering-Correlation-Id: 1782adea-9e8c-4907-7b51-08ddd0e9258f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OGJISzFGREVJVy9qL3MwYVRrbWdBVXJ6ZE1hS01GdzdGRUljcC9xSkFXT1lT?=
 =?utf-8?B?QlE4dndEWDAwS2dVYWV5a3JOdXBNQzQxODBiOWFWRFoyRGpIUDBRbjdHUDVM?=
 =?utf-8?B?N1BBN3B0M1psUXBqdW5TL1VHcjZFM1VHVEJDeDFMeGJQVnJ5YWhqRXZvcjM3?=
 =?utf-8?B?UUY2dU9aMDM4cVhOWnBRSWdyV040dzU1bDVxWFZMRVF0UUN0TmJzYzlsNzFr?=
 =?utf-8?B?N2oweGllSmZIOSszcjFFSzNONFZqcGFiL1ZzTTU5VWZmWnJ3ejVHRmZHbWpr?=
 =?utf-8?B?MTJvSXRRUjVmV0Z0TDBzOHNISFlGaEJ0ZXhWY2NLc3FUNlFoVENFc0loaHZB?=
 =?utf-8?B?MTJKcUUxSHhPYS9RQmljOTNpVmw0aHNmQm1oNmRXK1lwRkg2Vk4xaUczQ3hi?=
 =?utf-8?B?U3F6T2hYWHd3VWdkbURPR09DTWVsSG5CbUlEQmg0THpxTzVFc01uYzVwSll4?=
 =?utf-8?B?TGZTV0xLbDRsdjRzeVZiT2lFZFcvU1Q0ckNJZ01VelFUMXRueTY1MXpUNkZy?=
 =?utf-8?B?Y3ZiYVhmYUxCSTAzQnc0Y2g5UFk2YWgrakZVNjhCem9HNzFUbjJzbUhLNDg3?=
 =?utf-8?B?dDYvbm5EWVJka2JLSWUwUDdzTHNYWmtaT21xQ2hTT1FERW14SGYrZTRsZU11?=
 =?utf-8?B?YTZjcWVkSmF1b2tCQ0RrTU5CL05NdzBGYll2KzdxVWwxODhkbndueklEVWxl?=
 =?utf-8?B?ZXJXdjNaV3NHeVVlbE9Ca2tOS01pZEhCZDZYMGhwcnF0bFJ6d040SzZQeUJJ?=
 =?utf-8?B?M0JMVkFsS2RFa051a1YwNDNoTnhBamViamhBNXp3b1dOcnFRTWJJck44Zlc0?=
 =?utf-8?B?TDhVbURnbnlrVUJXVnRVTE52Y1BXM0lyb01Hem9rZXVWMEdXc080K3NMVUFy?=
 =?utf-8?B?R0dkT21rbS9DN3V5RS9JdkZhTUJqMmJkS0dHQW1URGZ1cnBuTCtnNHhWRU5Q?=
 =?utf-8?B?UExlNm9Ja2s1MldqWHJKWnY4Wk9qWjV0ZmRFakZ6Tkg3OVhaalZxSnNQSndE?=
 =?utf-8?B?aG9SK1NCTi9kZUdwd2FGeTlMajVaS1NIeERSVzc1NDAxSFprNkM3d1FjMHhM?=
 =?utf-8?B?WWFEOGozeWhFN1lwTFM2VXJEV3RROWJDYVRQd1AxT3NnNmJEMnVKUjRoeGd0?=
 =?utf-8?B?UjFPQlgrU2pPalF0QlByVGpQekl3OWtNTFJGbndxUFpkR1lTMHdtRS9DM2ZG?=
 =?utf-8?B?aTE5VkoyVWUrcU1MYVNKNHhLMDhyU2NEbFUzQzBpbnRhRXBXYmFxT1Vrd0dk?=
 =?utf-8?B?WURSMHBqbk5kMVhnTzVWMEdjVm5jVElTUjloNmh0T1BMWmNwVmljanBTRXgz?=
 =?utf-8?B?cGdZelFtZHBncVRtV0ZNQWRPNzMvSk42cHp2anAxWE93aGNZM2ExN1paT0Jn?=
 =?utf-8?B?c0JMTmZnQmJMQ2hmOXJNUlJBUXg2TlhnZUhLS2NDQ1dlWlZtU0J1cWRFR1M4?=
 =?utf-8?B?N0JwWUhUKzkrdjV4SUpBSld6Q29nbVJobktveDhJYWpyOTZnYS9xcFBLdVJp?=
 =?utf-8?B?dE1zV2JhbURUNWwvVFFGRWRjNHZ4UVdXSGh5cmNHT3FtaXFiaVpvN1cyTXY5?=
 =?utf-8?B?YVVTVTRFM3hxejZJckVTTCtrQ2ZCaHNBTGFxRC9lTXRjNkhEaFhubDlKc0Z4?=
 =?utf-8?B?MnRmckJVZG1xVmJTWkFwZTlIYXZjMHJBNVdQQjZENmdGYTJvUStWZWxVbklD?=
 =?utf-8?B?NkdlYzBnS3BISllTNkR0T053d2tobGRVODBsSC9RN0lTcUs4cVZwS2orcFIr?=
 =?utf-8?B?WHJ4MVhnSDNhRnprc1llakRJdU5KTVNhaUY3dUE1ZlBENlZwZGpjSk0wSjJu?=
 =?utf-8?B?dEJsNFB1b0FPYWUzYjcrZWUvU3FBWmVhbjc2aDVwM0RnZ0NBZFRhdkxyNUJM?=
 =?utf-8?B?ZmNHTmxwaUI1ME1uVFJxMU9MUmhXN0MvN2pza3FTRGhwaEY3V3AwcldMNnhS?=
 =?utf-8?Q?PtApuXxiU9c=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?LysrTFJ3MmFDd2NNajlsSndWUklTZkdXTmNyMFZXTGJUV0R5YmhUNEJkK1ly?=
 =?utf-8?B?Q2RJYmVBRGpJYXlGMGkyMU5mbmJaUEV1WTFkSlFKMkFqWnJoT2VrcjhSQ3d2?=
 =?utf-8?B?L3A3WnRBYmtxMVJZZGxHWlRHZFk0MEkzZFRIZ2RTTXdKYzlCeHRZOVZ1TS9J?=
 =?utf-8?B?Q21OMjZrY0xuUWRxaENhcHJiSmdxa1N6cjVZdDM4TmRzVndnaS82ekZ0akxo?=
 =?utf-8?B?eDJodEVVTFNMeThNY2pxVkhsR0s2c1JZVG9mSzA2Nnp0cVorbmQ1MzhWSTFN?=
 =?utf-8?B?ZHZPR3RFaDNXcTZMOFhNVmw4K3VRVFNoQ0ZxbWxPY052OWtXaXVwK01odEtw?=
 =?utf-8?B?K1k5aGdzL0Y5Ulg0RlFtSG1hQzRhSEI1SUNJc3pNRzlIQzFxcmd5VUNtYTVx?=
 =?utf-8?B?OWJWbExJSUJQeUREQ1ZOeXZPeWlmMXAwQUFnRVkzeE44ZXJDNmh5TnQ0eUJF?=
 =?utf-8?B?NDRmMmlEd09rSzZiVmJ0dkpBaG5GK2N5UE9ydVR4SGFBT1doejIvNWFzY1c2?=
 =?utf-8?B?OW15NGZGWDJ5STJmRGQyR2hSWWNWdlNPd05qcFIvUHNpUGE3N2RiaDJONE1S?=
 =?utf-8?B?T3l3dE1YQXYvTVZCbTJhWDFqelEzU09McWtsV0dMK1dWMDJOM0FqcTd6eHhG?=
 =?utf-8?B?aUNtWDRMZGRhRmpUQ1p2VjkxMEhTUDNkN0JHMjQzYUQvcGI3dEk2N1lOSkM0?=
 =?utf-8?B?YkN0bVdjNkhXWHZxVGF0UDcxeDlTcGtZRHQrdkEyVzF3bjR5bk44V1JoazZJ?=
 =?utf-8?B?TnVSR2ZlckVIQXRUZ2xOM3BEeStvaGtEdGllUnR1T3F6TGx6M0lUR1NBQmoz?=
 =?utf-8?B?V1ZEdHptckRBVzU0ZzNRRFFmYVl5UDRWeVRCbHNxakl4OHBoMEVid3NNUTFM?=
 =?utf-8?B?UDV5RzBXbHpMbUtMUWdsSDdIc3h6UGpVTFFmSm82REcveVNxUjJyQ0tlM2lU?=
 =?utf-8?B?UDZaUk9vVUh0NlNvUnJDUXRWTmVRMFZkdlF0blNXWkJQbjhIM3B1bHdGNDNi?=
 =?utf-8?B?elRHRDlvNjBpM2gyaTJ5bXRZWWxzWC81MjB6Mzk2RkNqMEY4Y29GanB3SGdp?=
 =?utf-8?B?UWtrdTJxakc0d1E1OHlQZUJTNWFPUmp5ZlRuY1M3T0paNFc1UVNZejlCZE14?=
 =?utf-8?B?VGtDWWFmWFd1R3BBaVM0VXhFR3dWVWVtZ2R3aGI0YnNDSTRkclpxNUFvV0hG?=
 =?utf-8?B?b2JFeWZGQ0JHZlpwZkUxZWd6Q3hKOHYxS2NyOEFBN1ErcFV3MlI2OS94aWh5?=
 =?utf-8?B?cEppNTJjczQrVk5IM0hKc3IyMlJseS9vMno3eFZqY0VFM0thWW8ySnBHSlAw?=
 =?utf-8?B?QXBFSXFUYUwvbk1UWGRZZ0dKcGkwT0NCOGNtYmdTRGJ4T25HYjhxOVc3eFJS?=
 =?utf-8?B?UDdnWmNxRi9Bd1IwZnhDM1owM0RCUjZMdm93NUV2OXFDeTFBa1AveVM2SGlL?=
 =?utf-8?B?cURBNTRQcit0QStEZkwyK2NkSFdwd0U0SmtHVVBaMFBweTNIZlNGUUNkazdx?=
 =?utf-8?B?NXJqK3J1UlZ4SmxqeTQyOUp0WjFta3k5QjJJMnNDZ1JjcDJTY2N5bHY2TU1L?=
 =?utf-8?B?S0NnaFlLbW9ScW1aOUNhNmJkWHRuNmh5dFZ6NlRNZ1FnQUZ0VDBHVWVnazhP?=
 =?utf-8?B?ZTg1UkIrdHlTb3QvOTl5dEIxaTVuakJwak5PMkoxVzhNQmN5WW9XcG5wUXo5?=
 =?utf-8?B?WStMTTVuM1Z5TEl2ZFBmUGdYd25uNXB1MXNiOGNwSkFRa09JMHlPK3NjelBL?=
 =?utf-8?B?ZytLOHFKTytjWkNqVmJBNk1INnk5VExCQVVaTHFkR21UZ1VLakxCQkpQZW9r?=
 =?utf-8?B?MCt6VjkxYXBpcXUzb1RoWTg2L29waWRDM3pLa0tkQzJYYWZrdnUzb2t1emx3?=
 =?utf-8?B?c3pqc1JUekdTMjZ0bDVtVU5wMVN1Ti9zcENuU1B1Q2ZKVlRHR1dwMldsc1Vm?=
 =?utf-8?B?MFRWQnlsUjNIYVY2Tk9xZGFoZEptWmxBWVp4djY2ZmpCYXZTRmE1OEtkVnAx?=
 =?utf-8?B?b2RSV2NDbUY3RDZiWk94TDEwb3NYOFEzYjZoMFRoRWZnL0J2WUtiWisvKzA4?=
 =?utf-8?B?K05qSE9JY3k4V3dyYUVCVEgvVDJERC9vbWZwSzRLRHJpc3ZqYW9Id0RtWWxm?=
 =?utf-8?B?clpTYVZoekJTUm11a080TENpd1pXK1FDVHBQenVkbFZ4ZUZYZzYxMFFONU9S?=
 =?utf-8?B?THc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 1782adea-9e8c-4907-7b51-08ddd0e9258f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 10:49:53.3402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sw4EDoU4nFMw0gx8+SrmEnfjKDfu1zD137uzPOPjgRpZ/21A6odRpsve/eqXTaGTaz8VaRR1HToFHq3krA9hD0cl8AFmR8NVNTRopnXpPqE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9495
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 01 Aug 2025 10:49:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7427

Hi Antonin,

On 7/23/25 4:27 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Drop after commit 068d38214307 ("insane: remove obsolete QA errors")
> from OE-Core.
> 

Actually, they were removed in bcc03ea19e103f6aa93bada2f49fcc5cc7bc0790 
for split-strip and a67e9ebfd5b8002fd4a7d8d27ff0d997817f76e1 for the 
other two accordingo the commit log.

The former goes back to Thud and the latter to Hardknott. Considering we 
aren't supporting any version before Kirkstone, it's fine to keep both 
changes in one commit :)

However, this should be backported to kirkstone and later still 
supported branches!

Maybe fix the commit log so we aren't confused by a backport to branches 
which do not contain this fix.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

