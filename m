Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42BA9C77B7F
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 09:48:57 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.62])
 by mx.groups.io with SMTP id smtpd.web10.4582.1750758534480656591
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Jun 2025 02:48:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=LXZRDOv0;
 spf=pass (domain: cherry.de, ip: 40.107.159.62, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tZcPI7hEaoydXQxLfHi6c1QXiqSJviPOuqNCG47igdA0KlrwkGFcwU0sSBdZm/kTcTTE7pkIwKodmQxFujHY+8Mnjgu2t89DnPQWcuamLv7jR5z4ke27/eoUm/+tWc1YiBL0uQOzGDmrbsvOe4yecMNI3Mhp04kbhqgetefvtIuLjjWbGLgSeTExf5cqie5WXewc2NcUKgzT1WTF3x65/H6BDPxblw6HV5ee89+Zl6fqX6A6EtaKPn/YaCqTQMSG3ixlzb6SIv2YsdlSCX51E2ZxOip+LVHOriM7LWI+sVOgo3+d+pgl5+CbLDc/1MO3JrctzpudpEnqxC2w2ep5Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9afDI3okRY57ipwKZ04ZeTNbICjm7Eu8m2+CjTW5AYo=;
 b=T1uAyvjsCdzvUt0slx5wA1v3hi0nHWLCRbZ+e9Dpj5htUbMMmqhwhcRfpLTxwo5JF2poaevOeUzqKi28qp672sP69Y0bnjuVDaKmFd9NHtZImafZdOIYU/qvhsXlGod8bwtw7yjFHnLMkgGzVfal1EKO6wHeEsn4HUpBDnc2fQuZV45kYfhPzoLKkW4XGzdv6IYl9anMDkm2k77s4IHW4pJ7r0WWGBxtwNZ4XyLISmxAAViJfETZmXdU6Fqz+TV40doiQABibpGivvy9u8qWQ0lcscw2ErF/vCSepLl1fu//WtJIK+4lS5h3VqBFZtPUbpDT0X65/a0/goNzl0+RdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9afDI3okRY57ipwKZ04ZeTNbICjm7Eu8m2+CjTW5AYo=;
 b=LXZRDOv0fbY+rRxQ/e/RrwVfFneMeo25M0y7aHWrvwHBUm3d0r4eQ55kVyvgw7q6RT/l0rzF3V4sVxbcrA4FuP6HPbo4fZlEL5WU18CQdcRkTUgG+64Knn7ScSmquBmiCmhDtXXDohllHBYdH4DpZGfi0tIjvKk2a6NBTsyWBFI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS1PR04MB9454.eurprd04.prod.outlook.com (2603:10a6:20b:4d9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Tue, 24 Jun
 2025 09:48:51 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 09:48:51 +0000
Message-ID: <7cab96ff-c965-4264-abfd-215e557e80ca@cherry.de>
Date: Tue, 24 Jun 2025 11:48:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2] dev-manual: correct statements that source is
 always tarballs
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <82eb83e2-a1ac-ce34-d680-7e4e50caf5a3@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <82eb83e2-a1ac-ce34-d680-7e4e50caf5a3@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0105.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::18) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS1PR04MB9454:EE_
X-MS-Office365-Filtering-Correlation-Id: 200c1e96-e9f3-4359-21af-08ddb30452ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TitMam9ENG9xZjk3TFBnUkNRMlNwZjlJQUlkY0xLT085QjVOMGxYMEFvb2Zx?=
 =?utf-8?B?KzlxR0ozSS9OaStrdXJoVi90WHlxNFdiVFBYbzI5d3pVb3RXbTYyRzYzSTlS?=
 =?utf-8?B?Q2ttY0xPV2NQQUVqTXlCd1JsS3VtVDUvYVdUYUJzMmM4NjBYc09XY1FnOUZB?=
 =?utf-8?B?SmNjcTdESVAvRXRXUUZXWXlWRXBlVjFPQU1Udkcya1VMZHowbDZ1eGNRYXls?=
 =?utf-8?B?MGphc3NEZXVWV2FNUE5sMWJTRDlWMGxvdCtmYXVJZTVpU0FHVktIa0pJd1BP?=
 =?utf-8?B?M1hnRUZUQkFXYVBBVURJN3JDTXRqbm1KaWhhNjZJT21BTnhwMzhvWWJyUUZN?=
 =?utf-8?B?SWJsY3NwOUZTUUJqY3R3SkpCYURwWjB4bkxNWUp1ZmFVc3NweFdnYy9zZWlX?=
 =?utf-8?B?VWxVRDEzMHc3emozREExMnF6dFBGWDF0R1Z4cU1MNGdNMWE2OTVOUWl2T3F0?=
 =?utf-8?B?Z3paLzVnZjRja2RLTXg5eisxRVo0QVBLRmNuWWtRRlhqVHNLclloU2wwcFpq?=
 =?utf-8?B?bzNxZDFib3ZzcDRDakl6RHRjN2k1TTVyQmNSWld3T1ZQbG1WVHpxYmhKOHBX?=
 =?utf-8?B?NkRVTUh3bjlGVmpxYlJqYUpMR0FGbHJMY1E2TEx6NHFpbWFoc1ZSNEMzY1VZ?=
 =?utf-8?B?V0VmNkJPN1NnWTdLbXQ4ZlRGeDhqU2RKSWJHQkZ0M3VtelNMbnZzSld1M3Z3?=
 =?utf-8?B?bDY2SVhvSk0weTdwZEZLQUVsalVCSTl5S1UxRHJZZENZOHpqbVlWa2VsOWpu?=
 =?utf-8?B?QVhVOG11cGJRU21SSnJXQjBsUktLWTlkWHlobTJ4M0RpVVB0ay9kTFM3TlJV?=
 =?utf-8?B?bHNubGMrZGxpTGVzQWU5U0lEOTBzRnJzekt2bVRocTlWaTg2Q3dHeFFPTTNa?=
 =?utf-8?B?Nm5YaHgweGdPS3dzK2JOakNscTFyTlEzM3hHRHBJM01zZjg1aWY0cGo5WFRE?=
 =?utf-8?B?dURWeXoza0tRdzM4MXA5aFRXZkp6QWp1SVQ5Qk1TMUpERUxtblZwQjU5NFlM?=
 =?utf-8?B?NnNwYnpEZ0ZkdldCeXBnZUFQZGl3c1djNzQwK2tCckhrV3lieWdtUUZWRXho?=
 =?utf-8?B?ckpHRVNmNmtCMngvN2lodGR0R1pwWk81S1V3a3RFUnFZQVR4L25IV1lVaEVN?=
 =?utf-8?B?OWxBTndnNjdZN3VjR0FUZmtmenBJQkU0a25RSnIrb3lQenRSRWx4WjJoUTE5?=
 =?utf-8?B?aEJjTFhJSlZ5SzlZVjExbnlxSVE3c2tuNmNMMFRtNkFHaG5USFoxS1BndEE0?=
 =?utf-8?B?QVROM1ZxelRrN3gzMGpGNXd0cm9jYSs3bUpKMmdpNVk0bloyYk91OGE3SHBJ?=
 =?utf-8?B?SUtFaDRma3hSM3NJNGNGUm5uSFpLOFRWbkpWSEdKSHlnRkVaSlU2Qlp3b0lq?=
 =?utf-8?B?TDhpRmVTY20wMTl5Z3JYWE5Id2JreHV5OVd3cVkrc05GdkRDdlNxWjQweDNZ?=
 =?utf-8?B?Wko5NXZSTXlDOTVxRStjVEZDbFRrWkp5MHg1aDFJVTVqankrdkZxaVdZeWZ4?=
 =?utf-8?B?T2JRaFd1VUpBWDdScGlKVlZLMzlodHR2QXU4NTBmYzdjRHlOYk5NK2tsUngz?=
 =?utf-8?B?Tm1McTcwdU1Uak1Ka09sdHhvL0xVK25IVUMrVWpQUWZBM2ZteVh0MllocWZ6?=
 =?utf-8?B?V200SnRyNVowR0tnL2IrbTBHSGkvaVFMODVpbTU2OGEveHdHRTA0NUx4bnBL?=
 =?utf-8?B?dWo0bFNHNjVOSEdyRmNRRzlZS0d3T1hxSU93NHdobkhuVEFtdHRLRldNQW9R?=
 =?utf-8?B?QjM0dVdnNXgveVpMQ3pXZ0ZPcXdFa3lhcWVBSGlmYWt3TXErU3JpN0NFUlc3?=
 =?utf-8?B?L3gyNkhCU01kcU5vdTM5RzAxQ3lmQXNaY1k1bzRQaGpVazFjZ2RRNVNkWStQ?=
 =?utf-8?B?akhmNEQ0WGJnY2dmekFpY2NpNkRtdE9vUGs2VXJzeWpxTnJTSWJwdUJOYnZ6?=
 =?utf-8?Q?0+LisLWxWQQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?c1lNWVByYUNPcExaV1o4ZWwvbDErZ1l6OG5oWW1GTERuQUpjZHpaeTRUU2N1?=
 =?utf-8?B?NWFvektUVjZLY2h5YVlMWjRYeDh0VWxaQWErUDlIQ1FFQk43VXFwTVM3cW5G?=
 =?utf-8?B?M0M2aFpoMFExc0JlenhLNElsZm1GaUNGMGdXWm8zdEp1ZVBiSzkrYjlNZ1Jq?=
 =?utf-8?B?bjNXREJlaThpdFVsZFBaRnUzSjZOVzdpSkExV1RzQytoU2dBMGEvOWcvbDBO?=
 =?utf-8?B?Q1l4NTYzQUlNaHJ5L3B0MXUxSDVJWFJTNmVnejBkTEdIUUxQOFBzN0UvVDBL?=
 =?utf-8?B?M1IrdzFDNWlwcDlEQTl1WExTaFFJdGtTK1J1dUlDVm1OZmtsYjBOb2tKQ0g1?=
 =?utf-8?B?NmtNYzZlNXhMTGdRYmlrZWkyR3JOMnNXSVQzWnFNK3JTajVLLzJmQXRTZ3BR?=
 =?utf-8?B?MkY5a0JkMFJObEtuMmplNlFOdlZnQTgvTmIwR1ZQNm4vcWxhZDRoM2ZMSHIz?=
 =?utf-8?B?NXFmN2ZSSExCWUhlbUlzUnhRRGNGVHFzUUtoaU9GZHJTUWlDNkNCeUpaT3lm?=
 =?utf-8?B?aVE3R1VTeU1BOFN2cjY0MWdzK1hBK0szUTRsL1daWE1BWmhFcDhub3JiTDZw?=
 =?utf-8?B?MTF4RXlqSUp5cU5WelZHQm8xa2s0elZUcUVBRzBJdmVOVnJkYWphZTJFK0hN?=
 =?utf-8?B?a0FPUHJPNkpwY2JqOC9kWTNuOHR0UEtrV0J1NlpyYnI5bG1QQmNacnVrR1li?=
 =?utf-8?B?Mk5GOGlseWgvUHlwblptTGg0eXlsSG40SnkxUi9QRC9UYXlYV2VvNFNYYXcr?=
 =?utf-8?B?dU9kYnlQOVN1eWQyaUNvdVdiNTBsbXorQ2dZbC9aTkc4Z21hNFFQWU5pY0pQ?=
 =?utf-8?B?STBoemlLeEFVT0h5UXpUbUYwV1dETXdNd1pOdXRpL1RyeUhPdVR0Y0dBSytx?=
 =?utf-8?B?NldiQmd5aXdicWp5R3Z0Y09Na1FDcnp2YmxPbVJqa1kwV0VrZkdvbXh5SHgx?=
 =?utf-8?B?WEJXZjM1Ulg4NTRuM2tPY3drOHFSeE9PbnY5cHQ5ck9pQUJrd0RQT2Q5Vmpj?=
 =?utf-8?B?YUpDWmFWZUdpeVpQOFYwNjJYdlRoaXlicGdVVEhyQ29iUTJVcU0wN0M0a2k5?=
 =?utf-8?B?RzdLdmZjTXVkcXlVQkRPUVhWTzM2U3pSQmNrUDFsd1AyOGxTK0l3NGw0Rm1v?=
 =?utf-8?B?dGt0RHRObHF1OVlUNWVyYUhSdDc4dVU2VWdOUnJPc3JuU0NSbks1YWVVNUhS?=
 =?utf-8?B?WlZGbWowQmN4QjkxcThlWXhJWEZ2N0NXSG1RVnBjc3pYNWpuTHRqWUZ4UHhW?=
 =?utf-8?B?c1FXaUY4dkwzaVU2YlNlZHdsVS80VHZTR3JjdUJlKzJyWEpnU0dKTkpYbXJJ?=
 =?utf-8?B?bUxLOWN4YnZiTHhDOVNOMUNvYnlDcjJ4aEY3WjY4NFd3SUNWeUF1WFNaeVVK?=
 =?utf-8?B?S3RwcllYQjF2c25xUlNuWDRYVm1GNTVSb1B2WFM5NFVId3lBOUNqS25VMVpF?=
 =?utf-8?B?VGkzMlNkT1Z6djlTUlJMcUpZZ0lwMHZ5TVRKdENBSmhIV3poYzgwam9WQTJN?=
 =?utf-8?B?bHZ6SnNYZm8wL0xrVjU5M0kzRkNKd2pZNFEzYlVEa2VkOVE0RXJ5R044UVl0?=
 =?utf-8?B?dWoxMGs0aEppY0g3YmZFQyt1YkpzL3RIZWxGa3JOWEcvSitLc2w3YkFGTnhB?=
 =?utf-8?B?Rml6U3ZXVFVyODJuNEpwL00wS1dhSU5OdzBCTngwaGtWU3ZYMWRWQmZKcjZn?=
 =?utf-8?B?YTVrOXNnY0tSK3FXUTJaTjJ0Q2FtWDlJUC9FSVBLdkYyQVEvVlYwL3hiN1ht?=
 =?utf-8?B?d25YZjhpdEtMTFp3cC9Md044cTQ1V1R3d2FLRlBILytWQjl2UG43WnltSWdB?=
 =?utf-8?B?eG9NektoSkY4ZWZVRmIyQURpQnJaRlIyUG41dXNlbXNlUjREZjAvbTFvL2Ji?=
 =?utf-8?B?UE4vbXQ2T0M2cUpRMEswei9vTHovbExmWSs0dFluenN6blF5bDNXZ2FBZzNK?=
 =?utf-8?B?dlA5eFN0TzJXTTI4UkhRNjR3VUt0ekpmbkYvRFFzdThiS1NKWVRBb3B1UFZY?=
 =?utf-8?B?VHd5T0ZsY3hZVWVTOEM1cE9PYThjbUI4eXRVQkdPai9lY0pOcnhzZ0ZvT3dB?=
 =?utf-8?B?bE1IVWM2MkVuNTBadnVERUtwYXFSaEo2UExHenhTTE9aRGFwUk4vVkhORDRW?=
 =?utf-8?B?VEg1eWpNWkxNVUhjbkNCaDl1b0lRbHp6b2pGdHY1aEczcGZ6RU9oN1ZvVi9V?=
 =?utf-8?B?Ymc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 200c1e96-e9f3-4359-21af-08ddb30452ee
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 09:48:51.1812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HqInlrz7zPI1y5nGYAfn1JsjZvXHVhJBD/ETuvD7ez8h5N/a3uhn9/UvdJIqaqkBokN551TuIsUrSft4oZ9tCCeiYABn8XVKbc4fH6+Hgiw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9454
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Jun 2025 09:48:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7203

Hi Robert,

On 6/24/25 10:16 AM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> Correct two occurrences that imply source is always fetched as
> tarballs.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

