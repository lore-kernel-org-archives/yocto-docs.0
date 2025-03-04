Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8836AC282D0
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 10:45:44 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.85])
 by mx.groups.io with SMTP id smtpd.web11.19269.1741085134113562945
 for <docs@lists.yoctoproject.org>;
 Tue, 04 Mar 2025 02:45:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=ItZzPlqi;
 spf=pass (domain: cherry.de, ip: 40.107.247.85, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aD/PmOmDfKrOQIa/OAu2UMLDSyoagWy+1ZaJKU3rZWkV2Gcjpbets86tcUREyqVdP+iq22eu+JKxSftlgcY8RC79/zA3bOkoD7SQyP4YTZjFSwxSABdiwQIbf8eMMOl0k366lgs2XgQodCBjo05iszxthWLj5PTjpn/TuEw441+m+a2xLm4HT18jbhZU8ixFNfBML63D3pMPgWgV6W70SukeT+CxSxEWNsd3Pkq18N3k5NXnscBxt6CrWeo4RDiBQVLvCBIrq0iV5/057ebADiIunDdI2RDd7jEMx5N6WgGEkJwfc1gRdU5MjftEiziDUQanGofuhaVcAcGhxhNiuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/sm52Geu3iJlOdb73F/Dnp82OCzGHeXCv/O7PJNQuys=;
 b=K2OyJF222c8vZlJPluzV9nBe+6rt5bHjnojuyDC20F+ZfUdpTVODrSKvWBrmYPdSOn09MgA9vC0LzO9MTstWihQz7uZzR1ftgFar778IjGnkTtz6jgBUkTjzvyBUGbNJ9/8rQClpKEpUXYUq60jr3LNMArMrFbp7aq0NAY3HKsc3EAsAXLCMj8giM1KUajod1ibfKoUXktsmBcyQm0/OdFudfDLJEHhjY0xVwQlxGAMp6aU4ErGfF5E6SnALxKYRI1NPphdWVYsqVbKRaztq6RtBeqUwRwR63WteifmHnS9Olf5gj0nGkgpqKd2uq8o2eqFh7rPzOKbjC9yyih+3XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/sm52Geu3iJlOdb73F/Dnp82OCzGHeXCv/O7PJNQuys=;
 b=ItZzPlqiva/oOeDS5pZp5gwl6FbfmJPLJZRGi+VPROLg55sBe2ppZZNap8ugyEJqcucKQwGtcmg40iGu9DFfIAA9JdIJQVZaRHGaoUc10OQUeisDeOz+8uRgZ0mueJIluEPubu6NWZptvC2HuA5ZKZClW2OfoL66hUrId0M+cpA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI1PR04MB6928.eurprd04.prod.outlook.com (2603:10a6:803:12e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Tue, 4 Mar
 2025 10:45:29 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 10:45:28 +0000
Message-ID: <2241b135-b4de-41db-9606-66007fe33eeb@cherry.de>
Date: Tue, 4 Mar 2025 11:45:27 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual: remove OE_IMPORTS
To: ross.burton@arm.com, docs@lists.yoctoproject.org
References: <20250227135847.3439559-1-ross.burton@arm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250227135847.3439559-1-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0323.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::6) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI1PR04MB6928:EE_
X-MS-Office365-Filtering-Correlation-Id: 0babf4b7-be53-48f1-24ac-08dd5b09adbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dFd5ZEtuQzFYaTgzdUU1YXJYbERmZy9ESTZiTDcrMHZEWWpjVEV1ME1vZENn?=
 =?utf-8?B?ZGFZZFlJN0tleDEwYlVtRlFaMFVsdDJDLy9UNHc5N2RDZFc4c1NuNDVNR1pL?=
 =?utf-8?B?YUVMOW5vUy9oRVhOekFmTmhkZlQ2OWlrZFNRZGZKbWxyQ1BCWlBIbStTdTdt?=
 =?utf-8?B?dTJTajUxUm5iL0ZHUDU2ZG4vVDhqbVVsR1NXWUlPZWMvbG1sbHU1NWRWMXZQ?=
 =?utf-8?B?VmFQUEo2b2JoS0IzSlUzdk4zK3lXa1RiRDNGNldUR25BMkhKYlg3cENjQ29z?=
 =?utf-8?B?V3RRQXNGV3pGT0xHenZRVFFPcy9VSXdqTUErZGM1ODRVUHVLbHIzUEdrMFZj?=
 =?utf-8?B?MzlVOXk5OEs1blpaM2F5SGlVOFhJdVlXbGw1TzlkMFZXWXpoUUMvS1ZXM3Uv?=
 =?utf-8?B?eVR6bTgxZnlkcTV2dU9RanpTYS9wd0d4d2xBRVRDMlY2UFlNV0NZMWlYc28y?=
 =?utf-8?B?ZDUrNFBZMitEK2dVaDhvMG5qRGRkd1MxaTRCdFErTnlIYTZQWjZ3TlUrb2RV?=
 =?utf-8?B?S0o0UjVHWTJWakdYdGNad0U3SEdRMXBDeGRtalRwZ3NrYjdBOTB2ZHgzNGZa?=
 =?utf-8?B?My9lN3FvSzVhdnBBbEl3bklWbHBJdjBJVDR1d1F0Q0oyckJybEFFanhYb01q?=
 =?utf-8?B?OC9OcXlHQ2dWYUZQaGM3THlCbkdvdWc0Y1JyV1cwM0VWLzhQcmRvWGYxN1VB?=
 =?utf-8?B?SXRhbGtlWFVEMnZIL0NsU3hpR0swS01MaDR6cStIZGV0Z1JrR2NZTG5Dand0?=
 =?utf-8?B?ZGFhbkpiQWx0R1Y4cEVFK3k3WWdwRjhMdm55M2h1VDhZcVZOUExXeUtZSGlj?=
 =?utf-8?B?NDMvalhmeHFDWHVmWUtsVXE1SnVPL1MxbzlCUGtmVno1TDJCQkVoc2UySjBO?=
 =?utf-8?B?bTNDK2NmSFhwMkovZVhXU1lVV0tGZ2d0ejVSL0xiV1hSZnFudjhzeUtaN0tL?=
 =?utf-8?B?KzFYY1J2U1BlU2VuY2xaZ0NNY0JCbTZVVkJldk4zTzh1V2ltMkZyNTdDNW1a?=
 =?utf-8?B?QlBGL2tEUVpOREorT2lPUTh4bUMwNnhEU1RTcE9OWVkrS29iV2hCVzdxNnNs?=
 =?utf-8?B?N3B3TmFvZDhrWXV1VWpQSklnV2k1QUcxNURsZVFNbHFYakI5bXl3Nnh4WGgz?=
 =?utf-8?B?VExIcmRTY0N0UjN4UjZHZENCdXpuTDU1YlF6QlgzTS9BcVJ6UGF4WE1xZXBM?=
 =?utf-8?B?QnpOcUFFS3A4VDlENjNuRFlLSjFCZGtDUkNnbFIyNmN1cHN2S29EYlZUNHdv?=
 =?utf-8?B?VHJqTnpvZEpkM0pJNHdMM3lFbWQ1NHZlUmFzR01JTzgvV1VVemxiaVZqSThr?=
 =?utf-8?B?NEdTL2VadHJ4UkEzTDJ1dVh6NHRTVlk5L0U5dm9rbk16Ty9UemJTWlhUMEIr?=
 =?utf-8?B?eDJLTmllQmJlTlV0R1pJN3d5emNWUUlnYWN3OElsbFpDeW1TMzAremtUb1V4?=
 =?utf-8?B?NTJTeGxiNzRPNWV0M29qMFNZcm4zUTlpNUpjMk1VQUE5UGRRQ3JFNlZJZmY0?=
 =?utf-8?B?TmUwRDN3YjFUaXhhNnYwZVlueGpsMHAwZU8yaU4yQjdWbXJYQWJNaHlWdXVS?=
 =?utf-8?B?WGdxSDFUS2NKbEhPVW80NkMxMm93Z2tVbmplV3hONmtRZlQ3bnlrLysweVps?=
 =?utf-8?B?VmE5WjkzUHZhSXJIeExCUjczNGh0TE1NcS9reU1PbngzTTVPdVl1RTdySVdU?=
 =?utf-8?B?VEt2NURkNEJtTGtuTS9Kd0NCZDh4clh2VVlxcENzaVRRbmtPc0JHcTNhMHV0?=
 =?utf-8?B?MWRDbDhaOHlwNW9jbE9yYjFsSFVnbmxRZWZOWEtDTkNuZ0x3T3ZMNmJuNUMw?=
 =?utf-8?B?M0dvdndFSzBocExZejNzTHNzVFRaNXkzMHZqbmtKQjNzbHhZRjFhSUJoYUlr?=
 =?utf-8?Q?47v2dy8lBMqt8?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TjhrK0RQWmhOeVJ0eExHTGxOTkROUzcveWRNRDlKb01ZTzZRcEhmSFFiWnZV?=
 =?utf-8?B?ZGFOaHU2eHZDOGt4ZWJ3bCtFTkhlWDBaMTZlM09XOWFtUGxLV0tTeEo4K29n?=
 =?utf-8?B?ZndFdFhoMU1hcFhmYjYrS1VYVnhWZThaTWZoUkNwYVJDeVRDMDlXM09Ielcz?=
 =?utf-8?B?eGU5K3pwQ3NGQXJMSW5vNVpoNmRvTzFMbFpVTVVxU3NweDlheFFiaUZjdkg3?=
 =?utf-8?B?U2c0dG54eDJkYmlTQTk1WElabk84cUdXeFA2MjZQMUpyOW1aSkllT1hJamt5?=
 =?utf-8?B?ckwyaXNNK29Ma041L0ZtSmNFR3RCdDdGaHRpb2JqTjRJdXh1S0NzM09hemdO?=
 =?utf-8?B?cTFRakQ1SVFLL2N0K0xldjk0T09hVzh4T0lNUE1vclZiL0I0Ti9xdjg2SFo1?=
 =?utf-8?B?bjZ1R004TC9WTDJtdWp2S3U3dmI4ckhXYTF6WG5kNnRjTlpRNUltNWt0eWl4?=
 =?utf-8?B?aFJhZ2p4c0VSNHc3L25PMmJnbE93MVNHU1VxdmVFYS96OUxaNkxKOUdsUkQ4?=
 =?utf-8?B?TkkzTkdiRXY2d1FiN1hjOXlBSDgwV3dVWDAxdytNODZKdTI0b0tKamh0VU5W?=
 =?utf-8?B?TW5idUJPMTZER2RKR1RwZmMrYU8yYytsd3hwRDlNeDJXcUF1UWsvcHNqTVNz?=
 =?utf-8?B?M3h0UTJJSXZRcC94cUpZc3djbW9LRit2Ly9qRWphQ09NdHJKQ04yd3dlUHp1?=
 =?utf-8?B?UkIyMmZ1TkFGNkEvVEFNcTEyUHhoZVRJR1ZwMW8yVnFqRXNvb1l3K2ZLZzJ0?=
 =?utf-8?B?ZUlRV2xKS21rSTMySFZhVFVRSzRWWkZyWUVxdlUvUGkxR3hLbkVZV0Z3cll5?=
 =?utf-8?B?UCtEdURJVjY3ZjJiTEdjd0QyK2JQbnJMYnk5MUxqWUlBQ2I2bFl5SnJjcEJU?=
 =?utf-8?B?UW9ya0ZONVFmYmdRRythUnZVTm9pcDUrbDBnQythbnVCTEtPNGxoMHUwdXhm?=
 =?utf-8?B?cGJBQ2kzZTZxL0Rzdk5tNWhwV3YzTFNJak5xZWU2cVJFM016Q3JhSVFZcWNW?=
 =?utf-8?B?UUJSQ2hjVkt0Q0RmNmdoMkh1ZzdwUnlVYzRSQmZBTGk2MWp3TnA3UGhMM295?=
 =?utf-8?B?S1EzUUtmbUV6aTE0UG5CT0h4dStudTVGWW9mcEhacFBIS0p0aCtNcm5ZQ2Ez?=
 =?utf-8?B?KzdjRGV4NGJRblB1OFJpNnRqM2MrN1NKNDRkV1U3WGlzbUZXTTdYZjU0blds?=
 =?utf-8?B?M05BdW12K3QwMWZ5QXVpVXBWcHZUQThxc0F3Wk9DWXg0VFZ3UUx1anlrdGcz?=
 =?utf-8?B?TGZENzJWRFhRUGNBYWlWdGthYitZd1cyQnMzODdXS2VwT2p1OTA5a1A3QTNH?=
 =?utf-8?B?WjI4SlN4VTlnak9KUjZ5SkNsU3N3dkZXbGdtTnA2STlDZ1JFVVVtYWtYM3dG?=
 =?utf-8?B?aFkwTmdjSmJKZmxBblBKWE55a3VPZkNOTkFjM1IxNlU4NDlUa0N2OExrQ3R5?=
 =?utf-8?B?WEsvUDNBeCtZU3JkMElnQXlmQjlnb044MWdZM1B5V3lFeFBwMk5JbWoyd0VD?=
 =?utf-8?B?RkVjY2dpUFprOThpaHl0K25ZVjFka3MzMDBWb3dVb3huTUczaWxyQWNvWXBp?=
 =?utf-8?B?dlRvTnBlNkxzTFFQVnoweFNsMXpPWTlvYy9uZzNEbXdTQnJXa0lmMzdCb2M4?=
 =?utf-8?B?QUpGNjdybi8zNTNqZUt1Ukk1NVYyUVlnaG1ERXRXdUxBdXdyNWRCUGhUZFE2?=
 =?utf-8?B?RW9BRE92UTFHV2s3U2lpb3E4TklLdlM4ZlFwQytBL2RZK2pKTGcvdGZSYzh6?=
 =?utf-8?B?MTBrVFVVTUsrM3VwRDZpZlZ0VkhnczZ5bXh3UmJ3bWRBRzEwTDZPcEkrb3JF?=
 =?utf-8?B?YTFSMTlyTDZ3Y24rampkbStKd0NmWnRtTkd3YVlaeU1yeGQ1QUMvekt6ZmRI?=
 =?utf-8?B?c0NoWUZNaXBXV0UvaXZuRlN3WUlqaXBYaFdzcGdwWDVsMUxDZTZoWENwSGZi?=
 =?utf-8?B?blFQbUZUb3FwcW51YUx6TEJnSWwvUnpnTEVNdHcwK1EybldheDNUY2NiVStl?=
 =?utf-8?B?QnI3ZFAvamVpaXVNL0xrM2VybjIwSks5dEx4bzQxNnFwaExmdTR6cW85MFhV?=
 =?utf-8?B?dHdDdzBPMVVwM2pPU3dUamRuSkpQYkFKSnNXOFdHZ0lJODVSWlBPYWkvZVlj?=
 =?utf-8?B?alFxQmRMWDFNV0JMZERZRkM3OGpEcnNSanhQNEZ3Ny93aUhNYlliWnF0SWU4?=
 =?utf-8?B?NUE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 0babf4b7-be53-48f1-24ac-08dd5b09adbe
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 10:45:28.7397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qf/LaO0nPeD0WCakWjbNay3vci4mzKDHUOifp5dD0tVi8D2BX7ag4sWBH955NUtjVPd9eu03yHptUBNlJuO4GQBZaffKQmU+IljeEOSl9Z0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6928
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 04 Mar 2025 10:45:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6494

Hi Ross,

On 2/27/25 2:58 PM, Ross Burton via lists.yoctoproject.org wrote:
> oe-core no longer supports OE_IMPORTS[1], so remove the documentation.
> 
> [1] oe-core 1f56155e ("base: Switch to use addpylib directive and
>      BB_GLOBAL_PYMODULES")
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Can be backported to Mickledore and later :)

Thanks!
Quentin

