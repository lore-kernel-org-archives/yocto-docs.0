Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85225C0219E
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 11:34:59 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.6])
 by mx.groups.io with SMTP id smtpd.web11.49029.1739792084921850104
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Feb 2025 03:34:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=l0AjG+NL;
 spf=pass (domain: cherry.de, ip: 40.107.159.6, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UofSc1cJlzlGAfN5ZQwAZZkdlrTy4abk9CrbjKwVnk+H2Ossx2AWHAPNgFQgJEACPL1AcsAKLLfnt6TqXZ64Xylwoc/AwMXnDGswFAihQcnN+jwANy7dOGsyGPc4K52rIYaqYREUwbc7Sv7298p8fnuEA1P5EnHt79Kf59mzhuXxA6ZVP+bl6v3cZqzR19yUOOUploiqkB3ORPML/Xrr6ux+NXVcCe9ikE0/4rpSG0Sywm72qeltrlskXLLKY891yUw9U46Ke5T2g2FiB2k7IvbTW7PhmB7ncOr3bVgGH8eLbaDdZJwtMG8kWTWnASYqXq19tDsZvjI/SZ/PhQErsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ioAFLSjAe66nQJsvd0xR75vrAh4bQYJgePU3bTWu3o=;
 b=WzyvDqPfPFn+6EDF3ehvGvKICxXq/tQAtLPR1tXRwWHiblVnYnUgGf8pwi1+OaGKEYfmS6YDxATSa11wEnXKq73ncfyCaKAGge/Tjuv3TntvY0TQGhOBXYYWX5BbOhafUBSXiUA9x9F1aOZG11o23PM/bKdHDW71+wR/RNwhX9bRZNjU8IT8FBg81hNHQXERuG/IFtcWVgQE4JXurg17MNtfHOGByrZkP26VlUmolGIN9XCcpZtIQjCtidzkNlKIK245AjSMolujmL34I1gXgkigfLQdZLlZ4KJMyy6LWxtl3FuE/UM0/KUqimDPbAuc/+/ENwjwJVC4pcukMe6zNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ioAFLSjAe66nQJsvd0xR75vrAh4bQYJgePU3bTWu3o=;
 b=l0AjG+NLTENjjQTX5LqeGPpejHLYBD8/qaf+GLG3p9cL6SsYd3yEbQbri3knAPqJwxmcj9qMTUbGOhB/pfIYKq2jIrpWJK+xocZdS8yNUuETE4cEyGlDUZfDTV8WTitlnSJI3wR871lJDrS4IU63arhmUznx5d/Om+nzxZKIZIU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DBAPR04MB7464.eurprd04.prod.outlook.com (2603:10a6:10:1a8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 11:34:41 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8445.016; Mon, 17 Feb 2025
 11:34:41 +0000
Message-ID: <f670cbb2-3624-44fc-9e79-d3086d73668d@cherry.de>
Date: Mon, 17 Feb 2025 12:34:40 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 5/6] dev-manual/multiconfig: improve the current
 doc
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mark Hatle <mark.hatle@kernel.crashing.org>
References: <20250207-multiconfig-doc-v1-0-f63cdab1fad9@bootlin.com>
 <20250207-multiconfig-doc-v1-5-f63cdab1fad9@bootlin.com>
 <592b4b1d-990c-454f-a5e5-04aaf780bc1a@cherry.de>
 <D7QHA22PDGT2.3PII4KVNFLDEA@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <D7QHA22PDGT2.3PII4KVNFLDEA@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::12) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DBAPR04MB7464:EE_
X-MS-Office365-Filtering-Correlation-Id: 7183d6d5-ec41-4599-01ca-08dd4f471171
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UXYvTy9ycXAvcDltNXBhNWd1RGZiQ1E0YTVYZ3VOQjVDMHFBNUpMY0pKTTQ1?=
 =?utf-8?B?R1EzUTdQYlFnQXZ3YnRjRVpvbTFCREp4bDdiOEpPMW5rNUExNFBzZ0dLNGNu?=
 =?utf-8?B?RGxsczNBcHBORE4yWXhmVk85QzYxWklleUtRdXNTd2pQckc2TldBU0JPcU9t?=
 =?utf-8?B?aGZpaHIvWFJ4dEdSelpDcVdhNEhLWHRVL1k5bVJwd1JCczZCVXN4Y3FFYUlK?=
 =?utf-8?B?SjFaTk05QnJCeDJBZGtDNitFMytHU1FkdVJnSWczaGJMWlU5M3poYjhuZHFM?=
 =?utf-8?B?QWdPT2I0OVhwS3FBRFpNY3VraHdsZ3pBK3p6YWVpbGk2Y01PeHZQSVI3Snc3?=
 =?utf-8?B?Zm41enM2R2ozN2hHZDllOHVwWEJPaTk2amVILy9jemp5ZWtBaXg4WFlXSzhv?=
 =?utf-8?B?T3lVOFdBSCtxUCtNeE5jMHVuNEQxVTJvNW9OdXAvSEE3OEhyRm5naWF3TC9V?=
 =?utf-8?B?MzVZalNodnJ4dzFHUkJQMWkvMEt0ZXR5S05hRGVSTHl3ZzRheXJXTEkxd21C?=
 =?utf-8?B?bzY3N2pBY2E0SS84VXBZNi9mei95RFZyRHVuOTRNbVY3YzZvdWRSSmc5bk5q?=
 =?utf-8?B?QVhjTXFnZnNOc2o3RmtRQllpWXRaellnMm9OWUQxR1R3Lzl6eHBCbDVUUEJw?=
 =?utf-8?B?Ujlock84TlBtRkkwRDJ0V1htY2xNRzZMblZxd3d1cEh6dE5YZTVvQUEwWEJh?=
 =?utf-8?B?ckpFQUhwc2YwcWQxcXhMT0c2RlFNczJQdEV4bEhET1FPWHB4bGJHZGZTY2RS?=
 =?utf-8?B?MEZ6ajh1MDBuTGlIajZiZEpsU3JZajFzOUFQVFBwdHN5MGFZOEVxMDhDTEsx?=
 =?utf-8?B?eTR2bEFNWEVPVlM2dVNLNmhlT0JUdHp6LzFSR0c2ZHJEcTZmZ2l3RXJmZDFU?=
 =?utf-8?B?TFNSbEpVNWZhcHJpeVlGZDVNc0EyNWswV1ptcjVPVElBbFRXWFQya2lHaSt1?=
 =?utf-8?B?MkxsS3FUM2YwS3FVMFhzbU9WT256SVE3M3ovUVlMRkg5U3Q2Mkl2UlpsVnN5?=
 =?utf-8?B?S3NLUm9CamxrZGpEUm1NVTQvOWFFN0QzcHhBS2ZsSFVrdGRjRWlnN1FVdStK?=
 =?utf-8?B?dXVYTldRclplOFJzVTZ2bWZlK2V0WS9IQTZhSitSOVJHYzJkSEF2UWZkRTJV?=
 =?utf-8?B?TCtidm55ZWpjbVVaVXRySjc5UzcwM2pmNGdtOVJPMVB4Y1Y5TC9Xb3I3S3Zt?=
 =?utf-8?B?a1VBbkdyb3BEU3VPU2hpT25Ib1Q5M2ZkdGh5OGNpNm9udU1EQ2g3YXJTSzZC?=
 =?utf-8?B?ZXNERlc2Z05rZFAvL0JTNHozaGgzdFlLTXU4bUVRVTFxSEhSSC9vQXVEYVlv?=
 =?utf-8?B?ZmxGeGI0d3hXQ1liYTF6dnVyczFZZjFnaDl5TDloSkNXVmUwYmxlOFlkcjcr?=
 =?utf-8?B?MkJGQTBha3RPSU9aTlFoYWc4VTlMSTYvRWF1WWhFN3g5WFFFeVIzdnVwZVlp?=
 =?utf-8?B?U2p5eENqL3ZnL1dsWStzUHJIM1BuTGRDZVk4VjNENlRic1F1eUlvRzhpak1W?=
 =?utf-8?B?TkQ5WjRlcENXbHhVZS9idHZ6MXpZamZwWWNtbW5JeTgwNjF4dkV4cDRnZ3Rn?=
 =?utf-8?B?azBlSGc3L3VKQXFDa3lsUUhNRkVpb09KS1hQNlZKZUFmV2c0TXkzMFg0V2oy?=
 =?utf-8?B?WXdkUjg3ODRINC9jc1AwMzVIWU15c3ZFUXFLcFF5bzhtOFRxUmlWQ3JzUndz?=
 =?utf-8?B?ZExHb21mblBKN3luWGFXVHdTS0o0cE9NWHhpcjBReWRmYTNZdGhqWXl5K0Q0?=
 =?utf-8?B?MlNuSXBqSzdFSHRrOWRnSUp1SEpvZXBEbUFBc2szR1hzQU5YVDBGY1FqemFk?=
 =?utf-8?B?NGgrQTFHMnExWmdzckw1Sm5QcWUrSXJPMHBZdmFUU1o5QUVydmw0Umk1SnRm?=
 =?utf-8?Q?DndASXsGpwsBB?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bjBqbmhNRFk2d3hkRjIwYWZ5K1JrQklsdlBYb0xQSWI2QkdObmxLbmJESHRW?=
 =?utf-8?B?NXRFOCtYYmxUSGVZS29mWDdEanI1d2FJbDVRWDVONGFLMlJVMEtOWnlWMHFT?=
 =?utf-8?B?djhmdFl2VkgzY3dreHRjYjlBc3VLQ3ZPRU5odmNQV09PdkxyRnYxZDltQVl3?=
 =?utf-8?B?NFp2RCszbFY2YTBpM2tQV0djTXB1U3Jtc1ZiM1MyUytDNDh5Z1YzbFVnblVV?=
 =?utf-8?B?RTJNY1Jra28zR1FrOXZwb1h6Mncza1lWazNFNzg2MC8rRko5T1JxdkZBZGE0?=
 =?utf-8?B?T3FpNlNXbkxxa1BzWGF5TkQ2Z3pQbC82RUhqa01QRm4vaGZyQ1JFVmxPbE1l?=
 =?utf-8?B?anJDWWJ5dmk4N2s3UGFFbFhuODFLSFZ6b0FqV0R6Tk1jZU1XaWZqOTEzd3Nn?=
 =?utf-8?B?V3RzbUN1WGQ5UnQrWVZTemZpRncrcGFGRmxQTHc3MThsK3BGUGdWdW1DNloz?=
 =?utf-8?B?Y2doMHVlSUlJWVZnWERtam8xN3gzZmN3Y1lwejB4OHhLb0RIOVkxOEM1bkli?=
 =?utf-8?B?Ukd4T1VhUWo0NUFNNmJPTWFndWRCNHJhNW1DMVQwNU9EV29NZmdmS3dJdXIy?=
 =?utf-8?B?YXdtN3MzbkMrM3BkaU44dHhId0p1QnUxVDVzWEhVWGdiYUlzTkc4SU5KYUVC?=
 =?utf-8?B?S3hITnJMWXltdG0ybFhpc3Z2Q0ZzS0VrUUc3VFh4cnFFSDVWSlV3RWx1NktQ?=
 =?utf-8?B?T0J1dndtQnJTQm9SS2lrOEZ3cmpkLzl3NUdsYVhWcG01L01mT3ZKcVp6Sits?=
 =?utf-8?B?cmVBQVV5ekxQTkVseFkzSFRyRFJMVWFIbXFUVDZsYmNMOFJyT04vdVRzUVM3?=
 =?utf-8?B?OFVTWUtJWEQ1L0c5Z0xadTZiMDd3ZVNtUm0rQjNxaTk4WlBNNjI5c1hzN0xW?=
 =?utf-8?B?bEZlUU5VREZoc1cxZ2Y2WVZtZTNBUjZENFlUQk9VNHJLSG9oaTMyN3VQUUU3?=
 =?utf-8?B?dzRoMmhkY1RKOC9CMjYvaCtzNXRSaERmVnl0TG9SVnVEUG4yem83L0ZkVTVQ?=
 =?utf-8?B?cXoyRExBdGlpdkdaY05nQWgwMkdGTHJkekFiTVp1VUR3V3F2UlhsYzkwZmhR?=
 =?utf-8?B?T3NOcFpXSDF0ZnVNbHRHVUlmNkR1OXNLalZaUzg3b2xmVDFkdGVQaFVpckxm?=
 =?utf-8?B?emRTZXByWFRqQVUyT0d6dWo2WUl2cmhHK2xjMWdaZmE3K09VMTJqUDVNWk1W?=
 =?utf-8?B?Umk3Y2c0TG9GRVQ4QUZGaHIvTEZIYjVOcHpuRFBZOU94czBIdk5MWml2TDFJ?=
 =?utf-8?B?ZnVuNDJKMWxBZ1NYYkRVVm41VnFaL3A4WU9TaEYwMGRBWHkvcFI1MzRjazJM?=
 =?utf-8?B?THI1dDBWSlNqTDRhQlQvR3NXTTNPMmxhbGFFanV6cDZTZEpjZUhXQ0RsQnRC?=
 =?utf-8?B?UFZ3RkJTcEJMOFJISm9CNDdJblEvL0JoSUNiY1pKZ1ZoZ2R2V01ZOER2Wkxp?=
 =?utf-8?B?Z0d5YmpDeUc3T2o1THRMeE80TlFkZlJkOXJMcHJmV1dKdlF6cWs0WTBNSVo0?=
 =?utf-8?B?Q3k5a3dIajJNdUE1bEphcVZhUXBROXIzQW1pMGUvMmZiMWR1bHdQK21vcjRD?=
 =?utf-8?B?UXlTV3NKWS9XVjZsL2FvU3Q5c2hINXAxZWpQKytYa3dIcnFxYnJybGZuQmdK?=
 =?utf-8?B?cW5lVUptS2gyWldrbVVjb2F1Q2x1dWcvUnNZL0hNb25mV2NMa2NOdWJRRDBB?=
 =?utf-8?B?L2R4ekNsSTcycmdNTHN4RTFteHp6aHRtaUVRcTY2MGV6Y2x5QXB4cFQrSUpW?=
 =?utf-8?B?d3BtUkJKTXRhT0VDdHVhR210dlFvNDV3M3dIeUZ1eVVEejA1dDRMUWJMU0RI?=
 =?utf-8?B?N0YrdzN5MGsvN1E0aXE1di9oemVSUUdBUElUTEtyVjFFQVhHVVM4SWZZaStw?=
 =?utf-8?B?WlBsS0lOMHlqQ3Q4WFY3R0lYK3E5N0REUEppdmlpL1NqaDZWaE9jLzJXTmgw?=
 =?utf-8?B?RTloeVQxQm85N0RFb01lRENQUHJHaHpMY0YwbGZZUStPK2xhNEQ3cnNHdGdz?=
 =?utf-8?B?NHRyR2tXdzJOaXpNK0RaQWRNQm8rWVBCZGpWYUJ3ejVIQ2RxWWRjTUhKQm8x?=
 =?utf-8?B?N3EwVWM4YmNEQ0FEY09EN3grZysyYUJuOEd2ZlRYN05XZGh3dTkyNS8xaHgz?=
 =?utf-8?B?SmEwcXhFcGhrYUJSWGpwVzhCVE9iaHpYVi8vMExmcEJIMTdMMTBqbUE5K2lW?=
 =?utf-8?B?VGc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7183d6d5-ec41-4599-01ca-08dd4f471171
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 11:34:41.3639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X/sRbyrYv1Q9H1Vwc9mTyO4vky/XgDR5ptxx/kKnzB7Hc+VOx0ZRSsb9owHirhccuys1RdsLF+/vrCnpFJucoAJOm+doIuR+wvwhvLD3QBc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7464
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Feb 2025 11:34:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6381

Hi Antonin,

On 2/12/25 1:49 PM, Antonin Godard wrote:
> Hi Quentin,
> 
> On Tue Feb 11, 2025 at 12:19 PM CET, Quentin Schulz wrote:
>> Hi Antonin,
>>
>> On 2/7/25 5:28 PM, Antonin Godard via lists.yoctoproject.org wrote:
[...]

>>> -   Here is an example showing the minimal statements needed in a
>>> -   configuration file for a "qemux86" target whose temporary build
>>> -   directory is ``tmpmultix86``::
>>> +   .. note::
>>>    
>>> -      MACHINE = "qemux86"
>>> -      TMPDIR = "${TOPDIR}/tmpmultix86"
>>> +      Whether the same temporary directory (:term:`TMPDIR`) can be shared will
>>> +      depend on what is similar and what is different between the
>>> +      configurations. Multiple :term:`MACHINE` targets can share the same
>>> +      :term:`TMPDIR` as long as the rest of the configuration is the same,
>>> +      multiple :term:`DISTRO` settings would need separate :term:`TMPDIR`
>>> +      directories.
>>> +
>>
>> I have zero experience with multiconfig, but I think the only case where
>> we should be able to share a TMPDIR is whenever all recipes but the ones
>> whose PACKAGE_ARCH is MACHINE_ARCH are the same for both machines (or do
>> not conflict, e.g. a different TUNE_PKGARCH for each machine). This
>> includes not overriding anything for a machine (e.g.
>> do_install:my-machine-a() or SRC_URI:append:my-machine-b, etc..; though
>> I believe this must require adding PACKAGE_ARCH = MACHINE_ARCH for those
>> recipes?). Overall, I guess this is a VERY niche corner case?
> 
> To be fair, I can hardly think of a use-case where you would use the same
> TMPDIR, and it doesn't seem to be the general use-case. This is why I moved that
> to a note, so the "proper" way is emphasized below.
> 
> Maybe someone more experienced can confirm your thoughts on this!
> 

Maybe we should simply not suggest it at all so people don't get ideas :)

Cheers,
Quentin

