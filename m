Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50DB5EC1113
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 17:35:23 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.128.1771868118079842745
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Feb 2026 09:35:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=TYpZc7t6;
 spf=pass (domain: cherry.de, ip: 52.101.69.46, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YGsOR2WcQW0rnVFFsTv6MLhPX2/tcj2bw41Zt90ujsp3CiGU5fRceYLMyCkgFfT3YDPlanNTQsAoSAx1PuUY8ACNjvNECwcKNrhUMn0GI0ay4DXIecZ9c+QZaXpd7PnKx6IBV063f63gS+YlCEOuKA4UF+lllxiRyjeVhTj7RF4fQtGY6vwr+KAFWHpsm/G+/MUOJaBQIciHtDXt40NYtstbeG/75iL8+e85g+AWBSaIJmb+tE7pvbJdNfsyRK3kWtv6kwPYm8Nv0cyCEgp9hD5GIQC4SY5fC24R3FmfnXVgzM/aI7YZEvvg8v4Nzlzr9HmdsuBkXYufzrss/5/DTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DFlp9sMB9fUkIvGC1fA+/GzzQ4N7DvLdi+faCLcILcg=;
 b=p04whM5oZwLHNI037QoSlwwxvKZiwJYAD98zv+GjinC2c6KcsgcBBkPjY+n3VPcMW1gQk9htarmOIHistijosKhS7B1D5ySvQmiL4RgrylSrZ89rvuPbHEyzYL+AvPEIKtDNP9OmRSR/clD4qWOimg9ZCLHQCDaYgXCYpN8Pys6cfweLHyRFVt7TTRD65t/S1ZQEBqGKkz4UYR1aPGQ4qotiVM9O2fkWHhyQVmB4ddkQP+Ra2WAmO4/G9gQmsU6MlptE9guwOJoaIKWRVp5KGvkkPMo7UBywB6PPbzbEbPOaZZrjyyF/ib4udVazG1oZ7FySWPiPty++mWhqAIcnIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DFlp9sMB9fUkIvGC1fA+/GzzQ4N7DvLdi+faCLcILcg=;
 b=TYpZc7t6qocDQpKcdalT4L/2pz8hUr/lYNCNR5/c7fOExZaH6BLqolf1/I9oe760395GG88mc2Y2vQtlHi/xyh+z7wDAeTN3q8OMZdcgf0662Uw+m+B9HvXXfAd4JVwUESsynw8YZtQMeAvihkk2lt7NdzMTkfB45u6rv1gSfUE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PA4PR04MB9565.eurprd04.prod.outlook.com (2603:10a6:102:26b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 17:35:12 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 17:35:11 +0000
Message-ID: <e41bdc41-be0f-4c85-bcbd-e00b10433336@cherry.de>
Date: Mon, 23 Feb 2026 18:33:54 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v4 1/3] use a venv for installing packages with pip
To: Antonin Godard <antonin.godard@bootlin.com>, foss@0leil.net,
 docs@lists.yoctoproject.org
References: <20260216-fix-make-multi-target-v4-0-749e588cb7f5@cherry.de>
 <20260216-fix-make-multi-target-v4-1-749e588cb7f5@cherry.de>
 <DGHXUDE510VH.1JG9S6P90SNTG@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DGHXUDE510VH.1JG9S6P90SNTG@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0148.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::7) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PA4PR04MB9565:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e9ad59a-1c77-45f2-3cef-08de7301e590
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|10070799003|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?U0VxOVdyNW1BNXExK0VvZVo5UnkvNSs4WHFhNUZ1U2YrZDFxWlVmWTZaNTlL?=
 =?utf-8?B?QlNKY3dwZUh4dTQ2MDVlZnZBN0Q2cWFOYldKY0JLRGJwOFVXS1dGdGVqdnky?=
 =?utf-8?B?dVV5TWxrcUhCUWQrbTVtYXRpVEc5YW0xMW0yeVZRalRIS0RFL3dDa2dZTVBo?=
 =?utf-8?B?eEh6Yy9zL0lHbm5XNXRiODV0N1MyaW8xOCszcTE2Wlg4UmJnN1R5MmsxM3ZZ?=
 =?utf-8?B?WmZXMy9aTFN6V0xhVmVaVkVOeDdSN2lEdXYzT2dWT3IzT1BkVExySDVscTFK?=
 =?utf-8?B?YWNlK25va0llekZjQWN3WEJ6MnNFNTBxSkNBUlMySWI4cnJFSDE1NHp4eGN4?=
 =?utf-8?B?NWVJMEV4YWJJU0VuTlVDMEdvVnZwUEQxZmpna3JEL3Z2USt0ZGNDd3RSS2tL?=
 =?utf-8?B?WTMwWis4bTdSUHdja2Z4VmJkWkRjZ3pYNG9qUkhYd0hFSmFXOHpuZ0xDSzkv?=
 =?utf-8?B?d3p2UTRUblkzWUNla3VjSk1BaU1qcWkzQzNFdWJGNis4QmlWN0d4bGJkREkz?=
 =?utf-8?B?cTErRjRtUTNCN3ZwaXJiMk8rVGpwSEIvQmV6c1JkZXMrRXhTbTVLQlROOCs2?=
 =?utf-8?B?blVYQytqY3VjZ1JlS2YzbjUrUkZlTlNMbXdTNU1DZmJOS3pGQ1h6dENySkhP?=
 =?utf-8?B?NWorekZaQ3NMaUk4UkFsbDlMUHlSWEwxdTBvVVN0RTdnTXk4VnVZcnZ5ZHRH?=
 =?utf-8?B?MVNvR0VGMTIxODRDYkRHWDhhTENDTlBFY1NQejdNdUtONnFucExXYjAvOUww?=
 =?utf-8?B?ZVNxSFlnS21uK2dvSlF5TlJzTzUxSm1LUTgvcXRrZjlaNUUySDl3YnRHQVV2?=
 =?utf-8?B?T1RiemN2SEtUN2IzeHM2WXY2dW40ZGw4VmNjUDYzRTNob3dyNjd4VWllNUVZ?=
 =?utf-8?B?b0h5WlFzV1hRK3ZWSWhFejVvZXJId25WOTZQeGhFMkIxdklZRDVqRjljUGhS?=
 =?utf-8?B?SHJvbDMxOURJT0NqcmhGaWNMQStweWN5VUxjU1k1cTZSMHBhK1ovTjViQVpo?=
 =?utf-8?B?MUtuakh1UmFPbGZNREZZMmhFRmV5bTRuNHhJNXJFWW13bWxqRGovL3J1T2dx?=
 =?utf-8?B?blNtWkxUY2tFSXZ1OVFHMkhQcEFab1lvd25OeFZVV2E2NkxpRU52UkhLbW5C?=
 =?utf-8?B?Mm9sUVBHa0hiMUVSM3hlN3BRd0tReXZaMFZqcnMrcE9kcVQxcEFvRjlLalFE?=
 =?utf-8?B?Vi9FcEphNWR1dWVCaHBSY0NpR0Y0dmpleGZPSUFqSVBJemp2ZVV4U2UxVEU0?=
 =?utf-8?B?U1owRGhjV1hLSjB3TGxVb2dFRGd0WmVFVVNnekFtdFNTWTFJTTZiZzFVNFpo?=
 =?utf-8?B?YXJaQ1NON2ppQnRqQW9EbzVONVZ5cUVoeW0wS0ptWVhjRk1Ha0ZUWnVTWVpr?=
 =?utf-8?B?Vis0TWdqbktXSG9mT05VN2tKK1lVQjdxMTZUbjRWODU2T1l2QkYrQU5VVGtm?=
 =?utf-8?B?VHhPVHlhc08rTzE0cWZYNTl3Qk9XVlBjekRKemZjNGROQzNoOWpVYnhBY2lS?=
 =?utf-8?B?ZS9DdDBHM0ErOXBhYnJqeVZmOWlLMUFHeG8xTjVQSXZUbjhHeGNVMmtpN3Ft?=
 =?utf-8?B?K2JTK1BMREs4dnkwblIzYm5WWXVVSlRsTzNDRmtsZWpNazNrQmFtRmU0SHND?=
 =?utf-8?B?MHZwOUNid3RBb1lyRnorTnd4cmdHMWExQ2grdGtxbER5dFh1N29SSVJDY3Zh?=
 =?utf-8?B?bUhFOEJ3Vzc2eUpDZVpRNEw4aU1OM2E1UWwxTkFTajd3VkdmajlBdmtWU2NP?=
 =?utf-8?B?S1NUMXhFMlExVEN2b1FkelU1dUFPcE9aRUlnUU5WT3lCUlJScmVUMzkyUTY4?=
 =?utf-8?B?TkttQmdnU1hvcURKVmRiaWNXWWNKZ2VJWFI0eTZEOGJDb3M5T0tpaThTWDNp?=
 =?utf-8?B?NkFxUWJUSEFYZ1Z4SGV1UzRCQlQweHRBV2hXNWxuU3JXLzdaaytJRzhVK2J3?=
 =?utf-8?B?M0hUZVJxd2k3UE5nNmNQeWJzYkxRa2wrbVBVK1Z1ZlpqWmFieTBPUUc2Y0h6?=
 =?utf-8?B?YXZaN3I3R2RRVzB4QzdDdE5rVGd1OEFvVnAxUVNGaDdERU5nZytUN0hoNTlm?=
 =?utf-8?B?ZmdxTWF6RnVjS3dnQkc0em53bnN2eVFuKytxVExhVFc0cGxCbzVUM3lNYm5I?=
 =?utf-8?Q?4WMNJ4efpkHobo5XRUpY1Dnyu?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VXdSL2VkcjVMS0p5cTdORlE5bTdBOE9YOENBTHE3aklUREc0RXdzeXZ2dC9l?=
 =?utf-8?B?QjUrQkdtbnQ0R1RsZVlFUXdDb1kvRjU5S0JuNXJ0Vk5yQjVZaUtYUFJXOE1V?=
 =?utf-8?B?dzZJSWF1Qm9YV2d5THlXejlvcWMySXFxOFVSeDh3ek9xZDFQcmxyaVZCSitm?=
 =?utf-8?B?QmRkc3RQVGFxck5qWWEyVkw3SkZTL2tsa3RXODZHV2htUXVoRFpMV3JiNGtY?=
 =?utf-8?B?L0FVd1hTL3RQRVF5VWROOXJLdVVlMGdOeHV6bW9XWHBVVkdPQUpVcG1EUG9N?=
 =?utf-8?B?NUNsRWlXbGFDODRlclMrQlh1MnhRdWk1YVFtbnllbzVON3BQLzIxT1ppVGVN?=
 =?utf-8?B?QklNbDdlbWQzUVFxSEdITHFWUUNybzZwek05Qi82Yk5GM0RsZURnUUtxMitL?=
 =?utf-8?B?QTcrUXdrUVkrdTNpYlROcm85amdiTFNwY3M1cmVEVGxIL0FNelBqd0FkQ1p4?=
 =?utf-8?B?ZS9GWGpBZnNpRmlsTmpjSUhuMTB1RzlEZWdGbThQMGhXakNLT2VtVi9zMTNK?=
 =?utf-8?B?bjhFVzJhUzB5cHdvbHdNQU5FRTJnUVNJNm1aMHA2UlE4M0R3NzREQ3hFSHFX?=
 =?utf-8?B?aHRnd3VTZFNpMFY3aEtoZjFZKzNtelhmMWROQ0czcWlldmsxMEZpVHNGNHNV?=
 =?utf-8?B?Snl3UEcrazB1MkhxUTdrQ0ZmOVNUZStkOFEvcG5GbWN2S0lpQjlqczR2dUln?=
 =?utf-8?B?eGlTTjR3VXNKU2s5bkRJUFNVS1JRMmZmM2hiNWp5TDdDcG1KOEU5UHpyMlND?=
 =?utf-8?B?bysvei9EVjVJYlloNmNhVVYvZFlySGg5SFUyMGIyMERuYXIzYW43dDFaU2RW?=
 =?utf-8?B?L2d0aUx5YzZTMnlLdU9lSElzNlJhbFl2MzZXQVZBNlM4em9KcG4rZFF0WTlV?=
 =?utf-8?B?SXM3RmtFazdmdnVTR2ZSYngxcWhKTzhMOXBRdmgyZm5PcjBEZ1hFYzFTSHd0?=
 =?utf-8?B?QjBaL1FvV0picUhSZWY2bW01Um9ucmdjQ1RrY0xKSlFsZDZKOFc2aThMTDZz?=
 =?utf-8?B?QjdDMjU3cUlTU1Q5UFYrbmt1YUZQZXdWWlRDNnM0N0VGZ25mR01nTHNpKzM2?=
 =?utf-8?B?ZWozRHFEYWdZUVd1THhXMWJYaVhoQ3V1em9DWXZGQnNYcHJTUTlEZ0Zzd3FI?=
 =?utf-8?B?aXVvRGt1c3dkVUltaHgrTHBiNlRNTjVkalpiZzFENDhzd1hiRmp4RUsyTGd0?=
 =?utf-8?B?NmtJS3pkZk1oNHZyWStaOWRmL3ZleFhJdFV2cGJoQ3hvRU43ZzRzMGdBYUdn?=
 =?utf-8?B?aldWTGtrOUtwMzhzaEVqUUZPcWY4V0xOSjlzTGFjSndzWGs1STBUQS9ldGk3?=
 =?utf-8?B?dzV0VktMRkk0ZjdVTjRJcDhabkxTZkUrRm5HcTB3RTlINk1FOXZXZkVqRFNi?=
 =?utf-8?B?U3BOZU8wREhtWEg2NkdnTm9UUENnOWptbUs1ejFpKzRSVUptZ1pIVnBzOEJE?=
 =?utf-8?B?YjlBY3lYMG4ySGtBZ3lXbGhXZzJnd2puc1MwRE9LeXk3eERtOG1BRWlYR2VY?=
 =?utf-8?B?eGkzanhsdkYrMk96aTl6dkptMTMvVlozN0hPV3hRdlFjaVFMa2xDejhzbjh0?=
 =?utf-8?B?Z2xqdVZmMlNaNW9kcWNIWkRxcmVwTktKQllpWHJua1dQZE45a0w5MGd2MGFL?=
 =?utf-8?B?RzZHb2toeXltazF6dDZUZlpjL1FabzMvbDFFU0NQTytabkVvSVJ4S2hoRU1N?=
 =?utf-8?B?bFZ1c3oyaU9ReEhyaFBGOVhxbjJuN2tiNDgyZFY4ZlRLU25MVDNkdmZWMHUz?=
 =?utf-8?B?TG1vY0p5b0dhYTdCZFFNUG9BbC9sN0dPc1BkeWJ4djlWZGRDNnhjckM2bmx5?=
 =?utf-8?B?bmF3WUFxV294aFUzblk0QXRiRjhrM00xOGxKOXhMZ0hhVi9RYmxlZmMzZmpI?=
 =?utf-8?B?T3BVUDFONktHakVsbFEzQ3dmaFkvZWxWQWR4VXhCY25COTArRHlZVHNsMHRz?=
 =?utf-8?B?a1pyOUZZTUx0bCtld3c4d2hxaWVOaHl3Ti9NRThGSXkxbkh3SUQ1MUdqa3JX?=
 =?utf-8?B?R3VjRHJXdmN3MHgzc2xzQXU3VFJIdmJrT21Xem41aUFTc2xMSnJwQUE5RnFp?=
 =?utf-8?B?ZUhrVVc1WnlyRS9PRGhsMHZLN1V0SmdkU3Eva0gyS2tqbGRrczBzMUJ0UzNZ?=
 =?utf-8?B?Z0dPUlJRbG9tVzR4TjlvUU5hM1NmSjY2Y3RLek1YaEs5c1d2K2Y0bDNjYjQ4?=
 =?utf-8?B?dWFLemlDZ2VxYkYvSmpsSTRPQXJ6WTJScnMyU0w0bk12Q1ZERzhSWWhCVUtn?=
 =?utf-8?B?QTEvVHlTUUJuZ3FZTW0weDF2TU02N3dWbVFIR1VXV2lpU3BYNHRqakVhdys1?=
 =?utf-8?B?VEtxcXd5a3E4Ry91N2tzRmk4L0N2V0VSVUVYVUR6RFIxWWFQalFWMmJ0bENy?=
 =?utf-8?Q?GFUV4L5l+pKpXcp9B2/Xn2lQQzArHk2g+MGoD?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e9ad59a-1c77-45f2-3cef-08de7301e590
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 17:35:11.7803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OY1AI+79WgSIfBxkwqXxeXZc5EgwYIfDAq42E1ri8LWt0RQ6V+bWUjyeJRS2F1OKTTJPxdgoKUJzPGn7jl5gPfu9U8BQph9htFCq0d8a/I4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9565
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 23 Feb 2026 17:35:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8957

Hi Antonin,

On 2/18/26 9:18 AM, Antonin Godard wrote:
> Hi,
> 
> On Mon Feb 16, 2026 at 12:26 PM CET, Quentin Schulz via lists.yoctoproject.org wrote:
> [...]
>> diff --git a/documentation/tools/host_packages_scripts/pip3_docs.sh b/documentation/tools/host_packages_scripts/pip3_docs.sh
>> index 907ecec55..9aa7f16fb 100644
>> --- a/documentation/tools/host_packages_scripts/pip3_docs.sh
>> +++ b/documentation/tools/host_packages_scripts/pip3_docs.sh
>> @@ -1 +1,3 @@
>> -sudo pip3 install sphinx sphinx_rtd_theme pyyaml sphinx-copybutton
>> +python3 -m venv --clear --system-site-packages /tmp/yocto-venv
> 
> I find /tmp a bit odd for installing a virtual environment (at least, from a
> user perspective, as I can understand why you did this for the container).
> 
> Maybe you can add a comment above this line saying:
> 
> # change "/tmp/yocto-venv" to "./yocto-venv" if you want a persistent virtual environment
> 
> ?
> 

I can do yet another sed in Containerfile to avoid telling the user to 
do that and just have the path different in the container (see what we 
do for zypper install commands). I tried mounting the volume 
(yocto-docs) as an overlay within the container (:O in podman) but that 
didn't work, so we have to have the venv outside of the mounting point.

> Also maybe, s/yocto-venv/yocto-docs-venv/?
> 

I was about to interject that because we use --system-site-packages, we 
could still run bitbake from within the venv and thus renaming it is 
unnecessary, but then I tried building the docs locally on my f43 system 
and this series doesn't actually work.

It complains about not being able to find sphinxcontrib.rsvgconverter 
plugin while it definitely is installed!

Then I remembered having a somewhat similar issue in my Python 
pet-project when I had the same package installed twice, once 
system-wide and once in a venv... Turns out that a package which 
installs a command/script doesn't seem to work with venv (at least with 
my sample pool of... 2). It would always use the system's when using the 
command (and it'd be fine with python3 -m <package> as far as I remember).
sphinx-build actually is a script, c.f. 
https://github.com/sphinx-doc/sphinx/blob/master/pyproject.toml#L99. So 
when our Makefile calls sphinx-build, it may very well be calling the 
system package if there's one and not the command for the sphinx within 
the venv. This results in not being able to find the modules installed 
in the venv (that is, sphinxcontrib.rsvgconverter). But Quentin, you 
would say, simply replace sphinx-build with python3 -m sphinx and all 
shall be well! Now the sphinx Python module used is indeed the one from 
the venv, but it cannot find the system modules anymore. If anyone has 
any idea what's going on, let me know but I don't think I'll investigate 
this further.

Instead, I'll NOT pass --system-site-packages to venv such that we only 
have packages from PyPI (which means, not being able to run BitBake from 
that venv). Now... this still doesn't resolve the issue of sphinx-build 
calling the module from the system if it exists... So I plan to change 
sphinx-build to python3 -m sphinx in our Makefile to work-around that. 
Any objection? Did I miss something or get something wrong maybe?

Cheers,
Quentin

