Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 224EFCCF9E5
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 13:09:45 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.14])
 by mx.groups.io with SMTP id smtpd.web11.32169.1761570575361885161
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Oct 2025 06:09:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=eVm2C62I;
 spf=pass (domain: cherry.de, ip: 40.107.130.14, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XpJLvfx5YGEOQcbJCyvPhEKd99hFyWHCG5sgkS17G4SHlpYNsyEyQ+hcrFZRkuAGemd1QA1Fz0Om7BG+F1nMsUvkMhWXdBURjJ1p9uzeM7lTNt2gXfWRBuIsxsyxo9+mxaD2r6KIKQHQ1YVjlfPJGt4vrcqD2QjgMdaD75YmbSF9/zwFiPOEqaFLYiOlvI4XdKVJ11jdYrX9K0SnxlQ6Cwq7+mq0eyUaoy9WntFMz2jxYmHC3rpaLoAWsvIS+HbP4fzbdnbRaD2EMKeKfueLeOA4VeW9ON0cH6AzN2L1tMjrq3AeVBubqlhPtx5mnSbT95PLjta3CPSs1ynQNYp5Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kasn/Pd3VVZ4bbJMSr6Vmk0uSEjC0PUQKkYIPsYClQI=;
 b=mWm46rem301k7XcXxHIPSwVnVCWy4psL7dXxANoKnXA45GkU2F8YR55RbPBu+oI5Lr8HzNUpnW5IQQotEruDB3HE1R9tT7t3kreBMJ8euGTHMybcs+W0NMGw4pAzsyMtLsZzw4NkYV4SOZrzhyVbvRpbgWZWHMmi4dLwThx9kwBrLTFtTDmP5bAfs5Yp/A4tCFZwMom5Qsxiuas3NqHPCd6F1Jh3DEZ7yUdddUYpB94ovi5dm3fW/KU/qy6UO7G0flXOYulf4Gi82xgLKS8KqNUgZ23+VPgoFs79N3B49k5SBTghZVyGbyXgMiHvfMl7WQig70/JxgqsqkSrYQQeew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kasn/Pd3VVZ4bbJMSr6Vmk0uSEjC0PUQKkYIPsYClQI=;
 b=eVm2C62Is/ML7SarAbAYDyBEGYpsbBCJJ2lzbvb8lAKqLiV6UDT9KkqWv8iSz8oQ1csCpVgcS0j4mVae00NaJLNHgEJ0V3QMvlq6HJgnYrbE/WxsS3bpSesHgylflXBy7P2qfINnUX5PdFg2LqCjBKXCHZtDZdvHX3o3Z5LTkxw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GV1PR04MB10726.eurprd04.prod.outlook.com (2603:10a6:150:20f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.17; Mon, 27 Oct
 2025 13:09:29 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 13:09:26 +0000
Message-ID: <dc48d332-a457-40ca-bc31-ac8bd7825ef9@cherry.de>
Date: Mon, 27 Oct 2025 14:09:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v3 09/16] ref-manual/variables.rst: document the
 REQUIRED_IMAGE_FEATURES variable
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251027-release-note-5-3-second-hunk-v3-0-07d36e2380b8@bootlin.com>
 <20251027-release-note-5-3-second-hunk-v3-9-07d36e2380b8@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251027-release-note-5-3-second-hunk-v3-9-07d36e2380b8@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0305.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::14) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GV1PR04MB10726:EE_
X-MS-Office365-Filtering-Correlation-Id: 577a5f4a-2c1c-4497-94be-08de155a0e65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bEoxOHErSk5qeVovWHduczJGZ2xxaVhheEpmQklQRFRYVEpZeXFxRVE5VWNE?=
 =?utf-8?B?ZjRSdjd0R2xYWENpZVd3b1NUSnVwMGhhRmRScWZ2TWRmQUwyTzBld045TEMx?=
 =?utf-8?B?dnlUMkVXWFRaUmVZNVl6aDZtSHdISXg0SDdJMXJ6OWQ3TEhxTUUrOTVTeWdG?=
 =?utf-8?B?UkR5cjFGbDJZc0Z0WkZ5VUZlbXFUWmo0aW9rMHVrQ3A3SmZKMGsvdVdKYmVG?=
 =?utf-8?B?WWJBOUpyRG5ZVHRLSXJVODNKNnBQWjlsZGg5WUJhUFk3OXNISHFEUFVHTCtJ?=
 =?utf-8?B?SXZNS2NPb0NGaUV6OVRxdllyekUzZUdiREdXOTVxbGF4KysvYmxzQU5wWk00?=
 =?utf-8?B?enZQUHJRZzQ0cmw5NVNDU1FGUGhrUTczVUlxblQyY0tZSkE2MkkvUDdIOStF?=
 =?utf-8?B?YjhmekFwSlBndE9oK1A5MTNZQzRqTWcrL3ltNCtqNmFyK2MvQWxiT1R4WGxk?=
 =?utf-8?B?M0xTS25uQzFjSGZTdlNrS2dsSUtkcHA0RTBsbnVQRGg1V0RSNkxwOXBpR1No?=
 =?utf-8?B?TlJJMXV0a3h3cDBwSEt0TWtpRnhvSWhGbXJ3TWtJVFNjelF4eDVmN2RSV2w3?=
 =?utf-8?B?cUpnbTRYVjVXcmpidlQ0c2s3K1RQQzBwdVZBdFo4cXBnVVhMdFdKMTZvZnpx?=
 =?utf-8?B?UEhZVUlLQkRXSC9nOW9qRWlZbXVFaVFPTHRWZ1cwaVZKMnRmVTIzTUN5WU82?=
 =?utf-8?B?ZTVFY0ZETWpNemVlTHhtVlhFUzByNDZFdGlrOHhQOWJrcVQwM3JkbmdHd3RM?=
 =?utf-8?B?L3Q0WXZjY1VlWDNRZzY4Rm5oVTJxaWRqV2RFbGU2Umo3NCtxYVlNN1YvcDZD?=
 =?utf-8?B?TGZnK21nOGNIaXFMMUYyYllFcmpTUnJQbERwWmIzRGZwNE40cmRlREtDY0Rm?=
 =?utf-8?B?Y0cxQVVXUi9yYk00Mmc1dE1HWkx6djBIbGNxRjZ5NGV5SU8xYUpGWFhhQlM2?=
 =?utf-8?B?Nm1weG1YdEdzUVZwNXVLRTlGV1FsOEdyZVNXMk1aWkE4MGxGRkVZYmhRMUcv?=
 =?utf-8?B?SVNRdnZ1RDhuUXJaaGIyOExsWjg1cGQ4citHYmdmSCtHMk1HcFZ6bFVWMEZM?=
 =?utf-8?B?b1d5WDQ4TS92TU56YnpwQUtNM1BGYk81K2RSQ2xvNWdxUFZVbkN1aVRtRVB0?=
 =?utf-8?B?bXZaVDVwdko5MVo5bHg4TlFleXE4YWVqOE5ZME5sWjgwRkxlMGxzOW1XN0Q5?=
 =?utf-8?B?R1ZEdXNzRnI2ZmZOc0pEaWg5WE56UStZL1plSmJPekU5a2VIdnl2aDdFNmlB?=
 =?utf-8?B?N2RzQnFFQ2dKbmhsVzdid2pKYjJwdlNZWkM4bWR5bnBGQXJhQTBMd2xhVXpK?=
 =?utf-8?B?dlhnQWY4Vmo5S3A5cHVucFh4YWc4TGdVNEg5aGRtYld2UkwxdTJsRTJDczNJ?=
 =?utf-8?B?aXp0STBETVlLb0tQZHR3dmJjcHpBTGxyZ1paWGlUWFNSa0F0MkV1djYyNjhL?=
 =?utf-8?B?WkpOU29uazN3dGRaWmI3aW5PREY5SWlqTDJmOVlOS0NUOEN1QnlDOWpFejR5?=
 =?utf-8?B?QlNKczdXOUw5ZzNQUHBSd1RjZ3FteWJKeGEwYlZ5YVY5ZlNWc2k4VjJ2bWN1?=
 =?utf-8?B?a3FqN2t0M251ZTVtVFZJQ1hOSmtjbmJ5ajhXNG5OeGpxRUxkdW5IYlF2RnlF?=
 =?utf-8?B?QzlPVG5Kck9naFo0UkxUMHoxQWwzT29zcEIzZThkQkJ3WmlUNERuQmtoRHpr?=
 =?utf-8?B?M1Rpb3VHcWhhVGJoR1JjZzFvMzF5V2QrTUNDVm1iaXlQb3BxWTJaT1ByZlFa?=
 =?utf-8?B?V2R5NS95REhiZ3lMcGJES1dudklCOGczVEVqT2JEcGRCRXJiVjRtSGtQL3VJ?=
 =?utf-8?B?WkY4bGRZWDVyVjNFdFkrTzdGSmk2MHdkMURtWThjY3MxNVZWbjRZT21tK2VP?=
 =?utf-8?B?YUtESnJNcm9ZNFdKZDFTVzBJbnltNTMxdUVLakEzcktobzh5ZVlJWkxPTkQ4?=
 =?utf-8?Q?/hy8IXcSIvUL+NqOLqOPc2WAtsXgl7ZN?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TnNEZU5EU1BxT3N6UmVaMjhwZTMvYldCcWM1Yk5IZjF3cmJzeVdyUUZuelVh?=
 =?utf-8?B?WFRteWl0cVl3RlFWSWxCM09rMEt0aE5taE5QT09VS3c0dTJjYTl6cUFGOVlr?=
 =?utf-8?B?Q29Ib1p3ZFBFRituU0hVa0Q1R3E3RS9pQUxQUXZoMkRtMGRnWkVzUmRZN3Ay?=
 =?utf-8?B?bGNuNXUxeTJKUVE4UlJiVi9UY3ZYMmYxMnBKVE5teFNrTUtjYVhSVU5Cb21p?=
 =?utf-8?B?RTIzVnVEZXBrakVqS1gvZURrNlJveFdDUDd1VXZMaEdPVktDdmduaEJZRi9I?=
 =?utf-8?B?SHhOdm14Z01oWUdiaTcraVVpVWEwMmRUbUEzSHZZbkZmY2pLV0lvREVjQitZ?=
 =?utf-8?B?bVcwWlQ0R3hiWnRnSjA1UEVZd3puUkluemxQbzRsdHp1aGZNR3k5em1ycUNX?=
 =?utf-8?B?YTFHVlF2WkJxbE1ONGJBc3I2SS9hSk55Y0UvTTh1NTFqNkVRdGh1bTdmcS8y?=
 =?utf-8?B?a3E2YzZaa1ZhRk9QRFgzMHNEVzZUcENPZ3A0cG9UNTY1c2RkTzNWQ00wSXlp?=
 =?utf-8?B?bVpkSm1FaUdoWGRWTmpEcXV0cDM2RkNKUFNUdkUwaG9ZOVR3a2pqbUhtTlF6?=
 =?utf-8?B?bWRlcHc1VEhtd0JFSnNPaHBnT256Q2RVcFJ2Y1JORHhsWDhKbFdqWTMreTNY?=
 =?utf-8?B?VFltV2o0MCtwbGlxa2ZGMFdiMDRDYWFnM2pKQXpDVmpwV1hLT0FwZG1jcDlX?=
 =?utf-8?B?ZjZlTUZQOXExK3QyZWE4blpJREI5ZHovWWxWbzJWZjJJMHlHRm9qOFdQYkdJ?=
 =?utf-8?B?dXJsNlVKcWxRQWVWZ2MwUy9VRngxOFhvNzdTajU4UWhPNlgrbXNDWUZQcDZI?=
 =?utf-8?B?ZmNMbHNIWEpGZnpGV3FwbERWRzExcG9LVFVvelV1N0FGMHdOSi9oaWUwMzhW?=
 =?utf-8?B?WEd6cEg3QXdQU0F0Y0JpM3Vna3hCL3pvR1BCU2ZNdkl1Vi9aRmtBbkFDSHJS?=
 =?utf-8?B?UVFDNm11bDNzTndGZStBWkpYbmFZdm1OdGdQL1NtUzkrdzhzL0s1aUNQYVpS?=
 =?utf-8?B?WU9HbktJUkZ6emFTRVJ1bzU4bE1Sbk5RR0xxY0MxVVdlcld4bTBtV0RIcVI1?=
 =?utf-8?B?bHd4bWNzUEE3NXZ0bFZYZE1NY1NIYkttQlhWb1R6MGR6YTZYd01odGMrbFQv?=
 =?utf-8?B?M1R3WGhCR1ZLQ3c4cXMrMjVYQVg4Q1lVU3RtUzd3bEFqQnNGaVp6TjVHMERn?=
 =?utf-8?B?bWQwMmM1L2xnZWJWSVNuNW0rdjNvZ2QyVkV3UmFSVEdtUE5TNUpMV0daRDcz?=
 =?utf-8?B?YWllSmtTT3lTc2dmajZqRTV6cDIzWHhEb05BeGdjK2laWFgrZTBDWWgwa2FU?=
 =?utf-8?B?ZDJDVVY0aTRobnRiSVlKRmlkSUJNM2VIeEFlN1FGWEtRTW1lWUk1ZEM2V2ts?=
 =?utf-8?B?T3lOZlU1b0wxbldnMFY0ZHZablltSTR6MzBOdmhFWW9FdFVSZFh1V3NTM0Jv?=
 =?utf-8?B?ek1talpWUHc2dzhSK1lVejhpTVVHYkdBa3ZLbUpwZVM1bDdrTGlDamhCWXlO?=
 =?utf-8?B?ejZFRU1XZ2JmR3Y4NUdkZlVvWFZjZzU0WWU5YjJSakUrSTdMWVJUWFZNOXlK?=
 =?utf-8?B?ZjlYTDQ3S2kxQXYyMXlYTTBBVThFUUF3VTJrd01uWjZzaVdYNGQ0cVZzWUVK?=
 =?utf-8?B?K096bHhSd2RDRVNLSG9HUDhVTGVRakNpQXpTSzhKSDRQczFXVDBtRk16UVZ3?=
 =?utf-8?B?Sk0ydFRNYjEwalR3eklDWkhDcWhjZFFUZlRiMWVWVXhZZ2RuSFFWZGZzTVRr?=
 =?utf-8?B?TEhSbmpNdDhyRmE2R1FVUlFDVW5XQ2FoeVJXRTdvMjQyY0VSSENETzFLWWJO?=
 =?utf-8?B?c1hMTHJJZklxL01iSER1OXRKa0h0cnFPQ08rcnQ5QnkwRDhGell3QjRFVTV4?=
 =?utf-8?B?MGhWZXIrdEN3aC9odENWMkhSTDFIQVhKZTNCVWZ2VDNhYWRTOU4rVVJXYlVW?=
 =?utf-8?B?ZTJ1TVk5ZnJyNFovNXgrTHVQZEc5ZjN3ejhEK25jdnd4MGRWT2RDME0yWTlB?=
 =?utf-8?B?VEJJckdBcnE4Tk90dG9KWFRZTkxQV1E1NGVQUnhVd2dmNnhSZFdyY01RN1J3?=
 =?utf-8?B?Y2EwZDYzS0ZFWEtZUDdSdjhqZ2tUWHIyamNSSW5zUGthWk83ckFpbnltZlBS?=
 =?utf-8?B?UU5hMXpFTktNT0ZzcFpLTERNR0UydGd4YXRDRjUyUE15L2c2Vy91QUpMemtE?=
 =?utf-8?B?Y2c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 577a5f4a-2c1c-4497-94be-08de155a0e65
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 13:09:26.7519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fxo5eY+OC/qJl3MRHJB2Qu5MpOiYRx25KByze4ZEIUOnBHnb3K2hJnzpCBplebYvI/ukPzqtgRCFuGf9hDMeSlc5oo3n6BGMpbKsV7TuI98=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10726
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Oct 2025 13:09:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7868

Hi Antonin,

On 10/27/25 1:43 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Added by commit 96a9702a24a7 ("distro_features_check: expand with
> IMAGE_FEATURES") in OE-Core.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

