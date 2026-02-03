Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A3D3E6E80D
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 11:07:55 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14371.1770116872004013008
 for <docs@lists.yoctoproject.org>;
 Tue, 03 Feb 2026 03:07:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Wgss2n2A;
 spf=pass (domain: cherry.de, ip: 40.107.162.53, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qfHi0ghdySbM2M7pdpESgc49hU/IBkR8MzMgmrOdeUhUQOjpapNc1eOWDZJ0OEXNa51YgfsieLMwFoyCH4oHQmW5bsIX/uoqZIGwUNQgbgNE45364f4pnNslYGnzXrRbfT1jZNUtY1nwf3BRyc6JLkR75K1cDMvfAsAvMsF0tBwGC2ioR/ejtu/BVdUh0/w2rZ/3FVFrrvgNXgIrACQwp/yibi1apwgCW9oOxQJtHzxJ3PED+i4ySsnZerHuXyfhszMpkUfTrLSuLPv+mD0WCvz/pRNqOUrUBLj3ElDdwTmv6C6q/SPNVxjD3dEZX+nYlGYsfQOlX6uA2Bd3+hLajw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0jgOx8BJNv2nPPN5cjzhd/sS0ZUtchbcJjOAMNbFGWg=;
 b=WdYxf1nSamYpsPs/p9UbnJs+Bmwzt2sPdpBhfn+Ncuy7pXRqcteGtfdVH3EKnRAm0d8vM4LMokmfY+s8nX4NW+wGidyoenw7v/nPp7j2E3CDtEjj76Ulcc7S+yD9F/a6OrKp+g+/tzoW2TI6PB2poSSGT4ZggO7fgKCm9mCRezk/x+fehq+HM29qYWTR/GZwzq7cQjexvvaoPvi9SV/TxsiGUXMuYOjsG0LITG23n13FtK30mZN3JLdTQ796fpaVXbmVhSSGSTnkSH7ATGJX6mTmNSNYMoJvY7cNtzz1J+umna2Wk+Baoj0hzHK3YZbebGR9WScmOjZWLb6UpQ0SiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0jgOx8BJNv2nPPN5cjzhd/sS0ZUtchbcJjOAMNbFGWg=;
 b=Wgss2n2ASTiX/HiAYowhnFRSPYlPqvFTj0mI2akY+XfuZRjq2VdysCvNhj2K3/OeuippMzlFqcbbfZWSkOrDHyPqYvJbk4FMEnmhJQtJrdg2A0jbCSyGNjjeM1zUlVx/xxSIGP9FdVAMJbdXSplQuT7vvUbUC7IEhDXD1LCbA/A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DB9PR04MB10035.eurprd04.prod.outlook.com (2603:10a6:10:4ed::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 11:07:47 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 11:07:47 +0000
Message-ID: <96b5c013-a718-4dfb-9ad9-5f04f6203ae7@cherry.de>
Date: Tue, 3 Feb 2026 12:07:12 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] brief-yoctoprojectqs/index.rst: remove extra word
 from text
To: rahimi.mhmmd@gmail.com, docs@lists.yoctoproject.org
References: <20260203104546.4046-1-rahimi.mhmmd@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260203104546.4046-1-rahimi.mhmmd@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0022.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::10) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DB9PR04MB10035:EE_
X-MS-Office365-Filtering-Correlation-Id: 22065e03-3441-49aa-148a-08de63147689
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?U2wzeEI0N3k4VTNFTGNOYlY1TGQrcEFIN2Z1allocEI3NmxyZHZ5SWZVMmE2?=
 =?utf-8?B?bkltUGpiRG1Nai90MzY2N0hGMDdSWWNlc3lNaTRqblVFcGkrQ3pYbUFvQ3dQ?=
 =?utf-8?B?YVNydjg0ZGdXTGxnMHRLYjF5bmY1a3loWVYwSGJmMjlGSWtjZGpjcTBmUnpK?=
 =?utf-8?B?Z3NoS2ZrY2x2TGhMTFQzdkZVY29yek9EZ0ZSZ2RyTC9VVWdOaWRrRUdGUHho?=
 =?utf-8?B?T3ByWFFNRllpUkh3YVNXZkR6UWlqMitBRkN0ZnZvQmpMMTVDSzZRc0JjT0dt?=
 =?utf-8?B?cnpDMy9hNmNFNkJhWk84Wk8ra0RhZEU1dU1kMmsranJRd3BQT052SjNWTWU3?=
 =?utf-8?B?eEV2OVNud1lWQkhtOU13ckt2S2xNMWsvR3hOejh0TmlKbzVoMTFrUS9QODdJ?=
 =?utf-8?B?R3ozY3FHOHpaUEtiNnBLK2tleEZXYktYSXF2R1RTdE1kVmJlUXZyMmJWTTBp?=
 =?utf-8?B?S0c4b084MzJpbzJ0TjJIWjBkV0xTbFpKeGNtM2NwVXJhRnc1aTlzcTdLY2tp?=
 =?utf-8?B?NkNIdlR3ZDJNdk9WR25LT1NvTjY5aERZbzYyZVYzNkdOa2NFK3luaXYwNGpR?=
 =?utf-8?B?U0RvWEpIYy90L1pPTmVERjMxNklnY245SjJPVFp0b2pnN3dnR2lkTEhRRHBz?=
 =?utf-8?B?aFZmTzFIWFBwRXNqb0E1OWROMGpFZEs1Z2xLS2xuYVZpQXdOM1JlaUkvMzQz?=
 =?utf-8?B?ZFJpN1ZhY1c3ZU9TWitiWExTN0QzeWVtVkM2YUJPUTR5eFhpeEhPdlJLTjZT?=
 =?utf-8?B?TkJHYTRRYUhmNDRoOEhMRUdhVFRJYkhZN0NPWEdqU1dZbnZtVlV0UTBjejc3?=
 =?utf-8?B?WTNrK2w2SWVRR2d5L1B3VzdScHQvU0tZNDZBREk0eDMvQ3BhelMxVmRkdlRD?=
 =?utf-8?B?NktMemh6QmsrQXBrL0EyQXVFemRYOWFWdkp3VEtzTjkrYnBtamd4WVZid0ZH?=
 =?utf-8?B?NElkUGNFRmdWVmtMaThVZ0VxQUlkeXFteENjSXJUWFFOdXhlckNCMDlDOFVt?=
 =?utf-8?B?TEZzYW16Ym5sYnBDN1o1WWpwdzVnUi9Pa2FQVTRxRHErRW9XeThCZXpra1ha?=
 =?utf-8?B?NHRuSnp2WFZuRGpIeEVtQnVYZ21tUng1TXgyVWhMTllTYmo5aUNHbHpiTndh?=
 =?utf-8?B?QWpZL2hwZmVZSVdLUjg5d0x6cFlJWmdLNVZqTVNadXRGY0xtRE9meGxLa0ZK?=
 =?utf-8?B?RitVSjhOelBPL2drWm1mOHNwZ1RNZlltUCtCTk53eFEvbTF6TzRYOTlHNWNy?=
 =?utf-8?B?K0h5N3orbWk4MUdzU1ZVck5RZ0dVakdVdXVqRG9kNjloTXYxT0x2bDdTMWZH?=
 =?utf-8?B?a01aV0JBSkpJdjBYK0dKVlpFdFpZVFZkVWowVFh3b0xLQUhFSENTY1NLQnRh?=
 =?utf-8?B?aEY1N2VONlN2UFpwa2JrVmMzVTZDR1A5UTRSVHJuRGJXMXAvTnRpdHQ5UVFM?=
 =?utf-8?B?V2NuaUVQbjBUOTdmZWNHeDB5VExKeENxaERqTE9FS2hrc2MwNXlPenNoK045?=
 =?utf-8?B?T1pmWjhKRHhGYm1EakpSQkhsMUgvcnF3enl6UUpaakhQcWtOYjhpcG4rL1hz?=
 =?utf-8?B?Q3BzWkNTVittREMxTDF2UmJKZWxieWlxTGdJYU0xM01ZY25LZWZwZTduRzRZ?=
 =?utf-8?B?c3dESFlVZFMxcXFldnFPUEQrWFRVV0swZjI4VEduWHd0aXJiZWVLS3RRV0ZI?=
 =?utf-8?B?WWZ0NGpERzcwYmNhN2NkeVhaY3VOMFBiWjkwZnZkWnBpMFZaN2prb1BndnBO?=
 =?utf-8?B?ai9QWDNwTFVKaVhMbDBHYUJ2YzVOU05DRnRoeUU4Rkp5eFJlOUY0TnR5dFRO?=
 =?utf-8?B?eUZBRURUeStUZ25qbWoyYTFST1RoWHRKZnhzeWYyN20rSFJsSk1jc3hpT0tv?=
 =?utf-8?B?Rm9sNjFxWVZzWHNkcDg3L29xb3RSWVlrUVVyZGJWL2h1dkQ0c3RtL0IvcXky?=
 =?utf-8?B?bzh1RHJvSTV6ZFYyRXBwZ1prUUdvWC80SUV6Z29lN01VbHk1YlI3YWZlb0tq?=
 =?utf-8?B?eEFUejMxbXo5d2U3WXozS2FYbWZBMllZVmtVZ1pGSnZaazJwekhvRDBxRnYy?=
 =?utf-8?B?ZExCdVpUZFRrYUlKMHZ2ZGp6M1JHT3luUTB5QXF6L0xacStVdDA0WWg4WW9v?=
 =?utf-8?Q?hBFY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dmFvTXJqVU51OGp2emw5dGhTTXhtRnNHc09WKzB1dE1qRmc3bDFJS3hpTGVp?=
 =?utf-8?B?djcyVmxhbXhCN1JFVVZtTWtJblFqdVhUM2pOYVJqeEFpTFhyZU5aVU43djlT?=
 =?utf-8?B?TWtqUXg4eEExcUtzQUdlM0l6bjRmUFBRQzNkTzQ5bndCRm5leTVYZ1V1MkhO?=
 =?utf-8?B?N1NURkpVRm9rNHNZWGRrSFpzUFRBclRPOFg5RlRPazdKVmZrZy9Ec2RpcnF1?=
 =?utf-8?B?TU9QdEgvc1dEcWhpS3AzaXRvSGhzSWNJN25qQXpIdnZ4MnozSjBiSndINi9P?=
 =?utf-8?B?amZRaUI4Y3hJRVlQdmhkVU1BaFQ0S3R4NmlYUllONVhBODVybHVxME9LRjVh?=
 =?utf-8?B?bjRCRS9QSTVZNU9LL0lNemcrNnl4Tk9GNjZ1WklheUQ4WGtnRzlCbjZlcElW?=
 =?utf-8?B?SCtHaElEZmJRRGkxTmJ3S2dtdm1HNzRmczkrUVlWczFoVFBkc2xqNVMwK1Qw?=
 =?utf-8?B?L1F1NFFPSXJ5NGJnMkd6T044c2pxQVl2cUx5UHFYMmVMOFU4Skoycks2eExU?=
 =?utf-8?B?d2RadEdCWDB4M1RTMzViQ2o0T0orMjQ4Q3R6dkRrWGhIOUdwUlpKTVBabUwv?=
 =?utf-8?B?c0h5ZFEzYjY4VVV1UGIrRUNTQmRuMitIa1B5WmJZWWJSZUR6S1owWDhBTFNT?=
 =?utf-8?B?QkZ2c0xKdDJ1WXBrcmh6SUFveUgyTUc1WDFvdUxteTNqQXM3Y0ZEazBXVzla?=
 =?utf-8?B?RXZWNnZ6YjlhWW5iRzVRY2Y3UVRkWnRuVlduTURBWEd6V1lVWGNtT00wbUc4?=
 =?utf-8?B?OEl0K2VuemYzdmwvdFB0UkZPNVRXL3BhV3JodExYU0FxNEl5ZFdsZGhQTTFQ?=
 =?utf-8?B?bDZES2MzZ0pOVGREYVlmRi9YdmdYdXZHVmdTU01COHMzYXlZSWdiZEsra29j?=
 =?utf-8?B?NnF0eWt0YXJnYmpWQVM2Z0ZWN01hQ1dNbTRGRGZZc0hxb3JvaXNXK3ZUZkNB?=
 =?utf-8?B?eUI0bUxiTDl3WG05N0RUc0VNT2JjSG1uVEhJd2xyWTVkbllHbTFnK3ozSzhY?=
 =?utf-8?B?ZXljN2l4M0Q1NlVKbmk1RUZBQTl5T0E2U3ZGRXd4aS9EUG8yeHZXQk80UFla?=
 =?utf-8?B?cCtndzdUT2thdWU4RUxsbXdQN2U0T2N6ZGJPRE1OY1FTRk5pMG9uZFlYR2Uy?=
 =?utf-8?B?MkY2NlE5OFJWa3NZSjU4VktEd2w2YkhMc3pjZU5mYXM2dGNldVcwd25LbjBU?=
 =?utf-8?B?M2tDVTREY1JHU3JOKzFUaVBwU01BNlYrLzd3dzRwZXdVcElQNlVmamZSSEFZ?=
 =?utf-8?B?U2tWS0UrcnRyQzdCakhBMm50TXpva1hmMUE0NGdmRi9scXM5aUMzRHUyNTJK?=
 =?utf-8?B?ZHl5cjc1QVI4WjQzU3MrelZyVFlRN3NQaUhrRHY1WUYzZDJIYVBDYlcwSVpU?=
 =?utf-8?B?OEIxTWFZSzFwcTBVbktjR1JFT09rL0dlMzhRVGtaSERTUmo0dGRNcXVabGUw?=
 =?utf-8?B?UitNbHk4MFdyOXg1bWZvYVhnSkg5SStsYlQzNjFuK1pVR2ZGalFzaVBxVlM3?=
 =?utf-8?B?OWd0VTI5ZGNqTENrZEtWMCtkZEFHWWNiK0o1b0Jzc3kvMUNMUzBLdGtxUngx?=
 =?utf-8?B?R3BDMnNta1lJRDk1Q1lMWEJpaHFvUlZWYWY5RVZEU0tCdDExZ2xUN0pjbWtx?=
 =?utf-8?B?VkJLcnFqdGVJUHZPZnF3bU5kZlJwbHhPT3RTZTl6MU44ODI3V016ejc1NDJz?=
 =?utf-8?B?czcxaEZFMXdEanNZNkxkTHN0ZTJuOUlTU2dWNTlkdlc1V3NmYnZJbFVjSG1W?=
 =?utf-8?B?SU8wVW1UUmRTTHM4elJPZFU4VDZPNUw2eGdEeWZiZ21RODg3dDZQb2Y2ZUV4?=
 =?utf-8?B?YXVOMXNlK2tnWG1zbjVVUm9QelRscDlxMHNiSm9hUWZ2U1pTb3FvMFhlUGph?=
 =?utf-8?B?aWYydmhITEdaM2NkdGdHOGRjWGNyR3dHOC9ONzhCSFY0NklkWTRhenU1N2k0?=
 =?utf-8?B?NGIvYlBnVU81dzFJdWJaditFTGh5UHdudXBERVhCMFhCbFhDdlVOUEJoeFlL?=
 =?utf-8?B?dHFnbVhoWkp1c2libXMwKzJyckdqRnpiS2l6VmF1U0xDNEZFUVlKdi9UMmFr?=
 =?utf-8?B?MEZKME1SWDROVFJvTitwWlNjQms3VzBSS2NMNlRyb1hvM1VCTGVjRFM5bVpv?=
 =?utf-8?B?a25RdFJ1WFJCdDIydGVyaC9SR0hqZUI1RTR4bzJhdDcxVjVuSjVzKzBOaDRH?=
 =?utf-8?B?Z0NTWVYvN0VmM2dmTWM5ak51OHZhaGRlbWc2cUhTZStyMW1PVGw0VW13cURU?=
 =?utf-8?B?RHd5dk5LUHJwQ3VTQ1lyWGt1c0dpVWQxYjAwb1JRLzFlYVdqeldjVUdzd3NH?=
 =?utf-8?B?Z0JINmpVcnVidTdkWSt2dUR1bkdJV2NhT1Fta0E0eG5VczFua0FBZXBpTiti?=
 =?utf-8?Q?FjN3hjqn1d1uhRo+gThQ3IQ8LhK059iqoZC2q?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 22065e03-3441-49aa-148a-08de63147689
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 11:07:47.4314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y7yGwTrg2JVIoh3ZtNtpvkOA6YyBjGVj+zMCYpwB+6RKA+TStwPcDf1NLzo3CzFKYk6okDIiyg/Fd8KfZJUDx8VB/nKbx0iyZGfE5m/EkFs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB10035
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 03 Feb 2026 11:07:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8859

Hi Mohammad,

On 2/3/26 11:45 AM, Mohammad Rahimi via lists.yoctoproject.org wrote:
> [You don't often get email from rahimi.mhmmd=gmail.com@lists.yoctoproject.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> The sentence in brief-yoctoprojectqs/index.rst contained a duplicated
> word ("dependencies it"). This change removes the extra word to improve
> clarity for new users following the quick start guide.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

