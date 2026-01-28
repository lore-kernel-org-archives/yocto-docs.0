Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DF1AD3F07A
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 15:02:13 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15015.1769612531800594204
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Jan 2026 07:02:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=J9DU4HsP;
 spf=pass (domain: cherry.de, ip: 52.101.69.51, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sRR7SVInNB1rQrdiDaiNtT4l7k0mMVpCX5iz+UILHuqLgQDEJ/PqBFFKh01vWSOsYPVwgcwOEGLNUx5SGWYqAp+4+4k/x7NmXyMvRvd4vQFb4Wcw8Jp7PJ0MW8ZbxbpoQjqL8zbVx7VMLhOcm9//1LhGW2p6WL94YIr0RUWFOn2Q5ROaIRifLM2AfgIaDcOA6IHlevH8qQzh5KPxBK/q3zfC9ZkoYfTwpfrEV9CNoLSr354gvmugTXimYE0a6mxdh+AXF6hS3cwz64oyjvhnZCYM1aLpaOIvecjevztq9IA+R2opatdehbnC6QE8SLDR7M+K3p+zLqj83TMJ8uXzTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nlgsH8ipOjr+QBSKK2sbOwKZ77eiKNmutATS4ggkIjU=;
 b=PYQmPnScOEo5hutcTEfQQFN2dcFKf6awGv29+VJ+2aEwYvdgauD1jr+tfV0R2lX4PHPbhlrcg/JLWFT1n+xexWW9IGCjn8vyBokUwtJ6wC3uKakZ+f+G4rseWBC/mVel9FX8WEzKsAh6XLelZ/qU5uAYYCgyEY7SpHvRXjiMYJJeLbkW2xR+woEEnhzqvCSLI0ZOyj/x22NLrEmXDNdW4R0YiX9WbIEMt4WKYXtCmUG3d9cw3akAqDC2bZq9Uh7l+ct79CFb2yl4v6Dit/+kxlmKocnwWBRqBfcTf/8GTxZOXrTbAVlB+kg+LRfarAtMqox2IckiM1+MXZSqaRlQcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nlgsH8ipOjr+QBSKK2sbOwKZ77eiKNmutATS4ggkIjU=;
 b=J9DU4HsPT0VL8W4evuV5H9tmxTzrTQbOIBhPLCIqmS3g65rljkiKjxrz31v9z3M32FXZuu2yoZchQ7T+ybKOESS1FTJVwhLphNkuuV0Q9Mlgf49dpyv1j+rfl3WMQgwawfteX6DPZjgp26VExd8DN2Y4GWl86rZTnsNekEjv8ls=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DU4PR04MB11772.eurprd04.prod.outlook.com (2603:10a6:10:615::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.14; Wed, 28 Jan
 2026 15:02:08 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 15:02:08 +0000
Message-ID: <539ff7a5-4ea3-4b65-9c2d-c962205be70f@cherry.de>
Date: Wed, 28 Jan 2026 16:02:01 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 52/56] ref-manual/system-requirements.rst: fix wrong
 path to install-buildtools
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
 <20260127-remove-poky-references-v2-52-74bf80cc4e5a@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260127-remove-poky-references-v2-52-74bf80cc4e5a@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0145.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::8) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DU4PR04MB11772:EE_
X-MS-Office365-Filtering-Correlation-Id: 92b17d39-53f8-4ec2-b8f2-08de5e7e34cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|10070799003|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dUZBZHNralZOSWRvQUVhUEdjWGR3WldWUmdhS0Z2YjZxcm1PQWJDVTV6aktX?=
 =?utf-8?B?amdjM2Z4RWFwRWtIT08wYUV3ek1tZHZXNStnUmJ6ZUVSUzhsNkZMWnlaZEJv?=
 =?utf-8?B?ejBtdHgzUERQazZYc1ZnMmk5NlB1d1dBWXVkNHd4MTZQcFoxR0dxRlBmeFoz?=
 =?utf-8?B?dHIrM29qTDlzUWcrWlhvR3dnY2VYdUErM0F4UGt0UmFCc2p1MlhFNHBnUFVB?=
 =?utf-8?B?Y3R6YlpXYmViSE9VNUNZVU9NWmlGYndaZlJvV0dveU50WEhFOEdzdVM0NzAx?=
 =?utf-8?B?Z2MwbjVDTDNLdVhaVlJWKy81R1BIU2U4MVVnSGRWbDNDSEJvdWVqM2duYVN3?=
 =?utf-8?B?M3M3Vm1FQis4d2lZcGgvU3NCbmFYNWFLTGN5RU5GL2FCSFZ3dzg4UnZVSDlk?=
 =?utf-8?B?WGZDdUpMUWNoTkwxZnBzTzRFY0tEK2tTT29UZzc5WkNNUEhKK1lTZU9EdlJo?=
 =?utf-8?B?eXRuZ2ZYU21FV1RVbEpkYWJYUWhldGp3cGxOK1JTMDhYbDUrT0RlUEI4RmN6?=
 =?utf-8?B?YmRJdFZpTU9EMHlla0NxU1IvN0VTRUhuL3hWTVp1blAxY2piSUJMU1JUMllv?=
 =?utf-8?B?anNaV0ptSVZGVmtZZnRmcy8zQ09seTFjQjN3TlRnem5zMzR5RWJYazhIUXlZ?=
 =?utf-8?B?ODNoRnA2d29jcEJDZzJnMWx6aGUrZUNQeXNCWm9TUWRxTTRBeGozek43bndq?=
 =?utf-8?B?ajQ3SEVGSFl5ckNRNnJjUmd0MW1WZEZMc0wxai9BZXVnTHcrdy9VTDBMYVBM?=
 =?utf-8?B?ekIzWGFvWm1BQnpsdytPUWdRd3VKQmQ5K1RlbGNuYjR5alVJcjFObHBQYk1p?=
 =?utf-8?B?bVRobEF6MGJ0RWFoMjFnNjQxN09jNm5UdGlONy9WNVZtWmVUeUZ4NmVYdnBZ?=
 =?utf-8?B?RGw1WkJOR29SOTRuS0NlMm1jdGtqZ1EwV3F2RHRQN1V4czU5Z0xUYzlZZlR5?=
 =?utf-8?B?ZG9ZTmF6UHhYWXNWOW9xcTNMVG5LRVA3RjFmRzlaRjBzVGFQNkJ6dlRaSWtN?=
 =?utf-8?B?a09LdktXTHgrMmpJbFJNNDZLbjZveUZmQVVPU3BhNnRZRmh3TktPYVZPY3RJ?=
 =?utf-8?B?Sm16YndSMkRxY0w3VEhOSHFHWkY5TnpFQWhnaExtNnloaVoxNTFNWGlGWHhN?=
 =?utf-8?B?NVlFMEFjcTJ1RWQ3a1hmeTJnVzVIUEYwS0x1SXFOT3lZc2poaHNBd2g3Zmc0?=
 =?utf-8?B?enlpdk1XTDJjMGRqVzRsTHcrdDUwdXVGR3U0UDBOYit1WFUvWkQwQWdJM2VM?=
 =?utf-8?B?UktyWFJGTFF5YzEzQ1lyUmdSbmFhYmRqMmxLU0JVNHE1dmdsb3p1OUNrV0sv?=
 =?utf-8?B?Q2s4cEd5Ni83WmxUVGhVOTUvb2o2dEhaSUl3QzZabkNBMmJKODg1Q1VsaGpV?=
 =?utf-8?B?WnJyT1ZNcFNrUDFYUEd5Z3dCcEROVXYyRDFkQmQ0TGpYTjBPRERLemNRNEtD?=
 =?utf-8?B?bHhpL1h4WWNEVW1PdTBZNG85Y3lnalhsdmhTL2VnSmxMdjhWWHhYd2R0b2N5?=
 =?utf-8?B?RjYwVXlSeVYzelNxaTh3OUZlR3ZsZTArNDVOVWlMVWgvTnpSSE5LZXE1TWNj?=
 =?utf-8?B?eUhYc0tQNDQ4TFY5YzR3ckg1b3dXaU1FM0thbURXYkVrZTU2ZVVDa2dsZ2JT?=
 =?utf-8?B?ZU1ySVlyRkZsV3dmRnAzOHc3ckg1OFVUM1hTN001eEd5cmtzWGU1SXhmUWF5?=
 =?utf-8?B?VTh0NFZVd0l0NGw3YnFYVWxTYjVBMmdrWUNITkQ4Z2RpaWFicWFnZVA0eTZE?=
 =?utf-8?B?cW95VVhFaUF0UHFCN1gwdDJGT3NHMlJGU2oxVGtSSWlQWXkzTy8xY3RuRGg1?=
 =?utf-8?B?S05hR2wrUzVwL0tyUmpONk0zWERteUV4a1IrcW1JRjJuenZqZXRQN0JLNXFm?=
 =?utf-8?B?TjVXNVZCR0Z0dFo3RjB1dHhYWm1zUjJhaDZaWFY4ZWwydVFSSFcyVkR2dHZ1?=
 =?utf-8?B?b0gzVWNFSE0vMm9zN3hUTE9UM2xLM1ROdWVOaGg2OHNrRUp3Z1hTTml2eERQ?=
 =?utf-8?B?SzNPcksrT25hd3JjMDlhUjFpQjEyNEc1S3p6eVR6cmJXR0pjTWk5b2d4bGlJ?=
 =?utf-8?B?cjk2aCtWMVpLcWhKU1czSmdISkZJQTNrWEJLc2pWaDVwZVMrM0Q0MUVHOUhv?=
 =?utf-8?Q?5ZdU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TTFET0J0NEI0OWZCWnBMWUtxWWpOOWMwS1F1TnliWWEyQTFhVks2Z2JrMVNP?=
 =?utf-8?B?RUdha2JpaHN6NXgwamtsTzhXcVZ4Umk0MS9aMUplTy9EZkd4VUdCM0k5WWYy?=
 =?utf-8?B?L2hndnBkR1FwdVY0ZkltbURTRFVGUnUvVFFsYzdWaGtlVG5YWVl5K2FYSFRH?=
 =?utf-8?B?eml0OGhJMkduaVVTUytTMzZCa0dmc2FQS2dJOHVIZjgza2wyeFBaUllqZmVQ?=
 =?utf-8?B?K2R4Rm5OZkZiMjFySGdhdjFNd2dLaXNRcmZFQzludUc4RWVCcXFNa3piay9L?=
 =?utf-8?B?cHZUaHJrdUJxbU5pRDlhR2ZsL1RZc3BKTEZadEdJQkMrbSt4NTZ2eU5BMGFm?=
 =?utf-8?B?eEJrNmp2S2x5YW9hNm9zU280MnBYaitKdW5jK3krbHB4MUdNd0NxUThXOUdK?=
 =?utf-8?B?bUlybkRvZDBnNThJb09INmhId0ZKN0IvbU9CMFdSSDlvekZjS09QNjB0aExz?=
 =?utf-8?B?eDF2YlJMMUE3NWY2QUZVd2RPODJ3RVZhNzlCWkp1eVlUU0dJMkJnZ01Oc1FX?=
 =?utf-8?B?VGpSbkNmcEx1RmloWUJySzhMbmd4Sjk1WllLVVVJYmQ3UVQ3RHdwWWVERld0?=
 =?utf-8?B?MW5zdVY0Ly9sWWZnb0ZIaGZSU0d3dVFuRGZUZHllSTVNelRISUQydHppV1g1?=
 =?utf-8?B?Q25tbEYvSDFIT0xqZ3d5amJDUmlpaUx6WUVVTTdoQ1NET3V5WE9uV2p6cDht?=
 =?utf-8?B?SkdXMUdnbWpVNVFNb2tBUWpDWXFGbkIwS1JkZmJNZjBDcXp2bUZqSWsydmsy?=
 =?utf-8?B?bTF5MVZoOWpQcXNNM3dNVlBJL204V1oxSlc0MXNNSGdJVHl2NVlhK1VGZDQr?=
 =?utf-8?B?NlA1eUxOdXgrVVdmSjB6N3lRNW5NeE5CYWRJczdNWTlJUzZBU3hqTXJydjJW?=
 =?utf-8?B?Q0FZTDB6a2xzeWpDTHFqckdCZlI3N291ZkJGMWxnTUN1cTVTZy8xeFRrcWZR?=
 =?utf-8?B?ejNCdjVFb1FnejU1R3ovdWYya1NUMjI2ZEFmdlhwUzBpVlQvU1ZDM3VZMW53?=
 =?utf-8?B?Wk4rWGF4OU5DRVFpS2M3NHFrQnlzeEN0V1FEeXdkSDRsbFNJOU4yNWlYWDB0?=
 =?utf-8?B?TzZBbmQ1TEllamd0TDl1RGRlaE5QeFFrbnBUZ2dranVmUXhibXN2ejVDWTBQ?=
 =?utf-8?B?cS9vazlKcFhsck1scXpuRmJHcGZWd1pWZjMrTzd5dUZSYktiTXZYdUYwWll6?=
 =?utf-8?B?SGsxZUFPdGNsUDRMRXc1dTA5VXdPbFFoS0tRQWpyV1FETE9yTVFleHQ0Ri9V?=
 =?utf-8?B?K3BXQ2dJc0EvRVBLRTl0QXBBVjhqWGJOczgxeGMzZk93WlJsNmZQY1RwQnJV?=
 =?utf-8?B?NUtsTXE4YzJqR1dEZ1d1ODhoNERjYy96eHRNcUhvT2d5SnV1MlArcm4wTmVa?=
 =?utf-8?B?ZjRvek8yNlFhWWxYZU8rVWlzVllYSS91bDh6cGN2ek9jUmlDbUpHV1VYRDNF?=
 =?utf-8?B?VWYrV05GN3VpU1p1bVV3TXNwSkhlUFJQb2ZEZS9VeWZoWVAvZFMvRmpnTTBX?=
 =?utf-8?B?MUlSVkFWYk5TYzR5SHRpMTl0OTBEMTVXUFR5aVU3N3N5eVR3NnpzQkdXeVEy?=
 =?utf-8?B?TXVFem5JYWJpQ0VpRkl0VFlvaFpUY1NwT1lsM0Mwa2pRNWRPdCtwcWg5M0N3?=
 =?utf-8?B?RWdQbXhYZFVUa1B5MktVQkMzUkNwWWN2QXpKclZJOE9DdE05TVlvbS9MMkNS?=
 =?utf-8?B?UktXMVlJZ1pTdnZ3a1QvSGFleUlxRVNzaWFFUEpUKzdDVk43N1NuaW5ZOHhl?=
 =?utf-8?B?dDQ3OGwrM1dMRXR3bDlDMUtQWGpLMzBYSC9oL1VZa25BQktueVdzdzRqU0NE?=
 =?utf-8?B?Z1RlSWRDdDFpU1NrL2I2VE9HTHRTWGhVdEs5QWlFMjhNenBkZXRRM2hDN2cy?=
 =?utf-8?B?UThXT21FWStLclg5OExpY3NzYlBESzFyZ2ljZkRZR1ZHYWRMQUgxNEFFR1dV?=
 =?utf-8?B?dmtuNVRMQmN4OThSb2UzcVF3Yms5SENQOFNGVk5JbjlGNDlLR29lREtCZ2wv?=
 =?utf-8?B?RTdKOVlibFBpb2wwWW5yU3VlYllsaHdjU2JGTCtMTW5mOFZjUEJYOVA0UlZP?=
 =?utf-8?B?bWRlek4zemJRZ0NOSkZmOU5ReWRGZmJ0SjJQeTZOR2VjZFI3TlE1N09la1A2?=
 =?utf-8?B?WVM2eTFCQ1FLQU9ZcXVueElRZEV1S1UyZ3pHU2pHdytjT201WDNrRFEvcFNO?=
 =?utf-8?B?ckd5ZkQ1d2djK3BuaDJMSnp3a3VJeXlyVFFmd1JBR2NBZ0F0WGVhSTVMUlcw?=
 =?utf-8?B?OHFMeFFNMXRJUGpKR05KRlQ0N29nSFJubWJYWjJIQkhOM2M2OTJBbU9HaWhD?=
 =?utf-8?B?WGNNeVVKVHc3ZndXQ20xK1MwWTZ4b3o0Rmh1YTV1Z3RFVWJUOTRLQXdxYisy?=
 =?utf-8?Q?xVINhFmrlRKtEjd4czAab7lvV3U33VjClOVcy?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 92b17d39-53f8-4ec2-b8f2-08de5e7e34cf
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 15:02:07.9655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F7zUR6U0u3W5swR5huGdy8cj1ccNloC0hL6ki4X7DBpe51bBrQmvGp8lci7febG7/VdiJmBjLnONOpZuCZ4z53Lf5MwSG1cdsZqTVERUgvg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11772
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 28 Jan 2026 15:02:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8775

Hi Antonin,

On 1/27/26 9:19 AM, Antonin Godard wrote:
> Reported-by: Quentin Schulz <quentin.schulz@cherry.de>

Ah, well, I had forgotten about that one :)

Please ignore the feedback on patch 51 then (keep the R-b)!

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

