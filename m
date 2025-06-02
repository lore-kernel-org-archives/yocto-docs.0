Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A9E3C54FB3
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 11:54:46 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.53])
 by mx.groups.io with SMTP id smtpd.web11.47798.1748865278312253017
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Jun 2025 04:54:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=GK/bTRCx;
 spf=pass (domain: cherry.de, ip: 52.101.69.53, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VUmfi2daI60AAEy1HDwmIsk4rn9Cmrk5QgldZF8IXw9s3xueFyYNtthSp7uHgEvCAqjM9p7lSQVcp/Uqy3JCZR5eSjdU5tb922IaX7/PEH/K9ynMsUmEXqs71xiWPFH5Z/QwSGSXLhyPw0spFdudPoz9w/oSTQenDONf13e1Fkx1eCkE46RlbAWO36hI9QMBBbAn4Hvaq9wOhuPzcM8OlfA0evpAnVmqq55RxC0Xc3SgZDoJrqMVWcqUEwotI/tYxaMIula9AY/Od2II9fgs8HyLM/MNqN0TQfJB5XTZ13plXHRWfYTixoF29MnSl33vl+PltxrhIlC+udlJyCmM+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AwumlMAH9uc5YFQtBWLJK6wZPFvL4+iYo7zVqsMR3m4=;
 b=YURjYue/mds/C1w0MHUbvFGrVXBzGZVMzZkdKjjGqdFYqVpeo8WNiKfdCgyrm4Wt0j8p0D2Klh/HnYS45TDYik1BhmcJw+NTZzw2zrGokkHVqVTLn5RPm+ddnHl18iuzjTYuanI7n+Sb+mOuhpPHcK5ifD59v3wg1f2pCDVfPeWv4RbvV1kSqHSJzh+WL3TUFB6hKdlFQXWb6DAfddSxSPssgioO76j2pY/YHqonFMhVfg4ovIQXVCRrRccZf+wCGe3kvZVw/fRwnMK5JNsPdwOb/gne/G0rvDh7cttA58f0EiVPfo+BlygxGOp1Ij2Xk8+89zQOZtJ1COfDD5jjWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AwumlMAH9uc5YFQtBWLJK6wZPFvL4+iYo7zVqsMR3m4=;
 b=GK/bTRCxDV4XaVY5IMe2nqfnqqbQiXC0giRbvAAS8AOP2Kjhb4TSLwHxiWFAHKvAGKWdnPyFbLqKtd5X0v5Vli4bUlm+jDwMIhfayl1K2dQt1Q6cYC8kNo3wVcl8TcLoCiJAos3f8JWTq0+Mh8DuWZPG0VAyyi2Cfe4wZbzKcgI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM8PR04MB7859.eurprd04.prod.outlook.com (2603:10a6:20b:24c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 11:54:34 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8769.037; Mon, 2 Jun 2025
 11:54:34 +0000
Message-ID: <94a99d67-9b2a-4f89-9b13-01df5aefaeaa@cherry.de>
Date: Mon, 2 Jun 2025 13:54:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] Explanation of bitbake variable flags seems confusing
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <4bcc9347-d780-1deb-f034-52bb80d4204f@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <4bcc9347-d780-1deb-f034-52bb80d4204f@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR4P281CA0311.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::18) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM8PR04MB7859:EE_
X-MS-Office365-Filtering-Correlation-Id: 9455904b-ace2-4be0-2265-08dda1cc3e40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MnVORmMxL1FVVy8wSUxBZXBNdko4Y1poeXpIWURTTXJKQXNtZVZiaTBnTjI4?=
 =?utf-8?B?aTYybXBIc2NZbUpqdXZ6UG1wQmw4RnQwVmsyb0VRQ0dnSmZxNmgxOGR0SUpV?=
 =?utf-8?B?bEJIaFl1bWpsbDB5eEN4WXlHNWhJajVITWNodTlBQkJwZVpCMVJPTnBqK2N2?=
 =?utf-8?B?UUg0ZUVEN3dNZ3E0YXozM2hhWHNNQUN0cjhaNHZnU2FFUEtVdGtSRDZRbVBj?=
 =?utf-8?B?K01YTXhrZVRPZXZvb25LanFISzdwQXBPSWtPYUxMZTlaU3Vxc1Jvb0s1RE0x?=
 =?utf-8?B?UVpsMzhabzJPL051dkxmY3V2TCtBeGpaSng2VStTSU1jMXVHb1cwRnEwNFRD?=
 =?utf-8?B?bTJ5Y2tSTGE1MTZTdlNHNTlrLytjczhUL1lFMStCR1E4ZG8yR3Z4dGg2WnJt?=
 =?utf-8?B?eFBoR1hIaHdldmVJNjhPQ25mWXJLSng5Y3J5VXRQakE3SVNySGZzZnkyV3Vz?=
 =?utf-8?B?Nm9RSkpjS1FhWHlMSkxQbnJ6dU80WDkxRnRSQ05lNmxvdTlkOEFwYVZiaG1h?=
 =?utf-8?B?eTBnYTdyblV0aW0rbnFIc002M0hGNlNxbmtjdzdZc2h6cHBDc3NGWlFPWEtj?=
 =?utf-8?B?cDlpZ0Vpb3VHTXlXb0JCa0phY0x6akZub3I1U0V0SXlwR3ZCZ2hNaVJxblJM?=
 =?utf-8?B?NkR3LzVtYkVwNGo4MEQzS1YrOExNU1F2QUdaN0FiU2hlOE13T0E2c01TU2tm?=
 =?utf-8?B?Mk5WMTNDWForMXpQTkcyRmN3eE52YUhqZURCOWJKcktGUFVIUHhnZHgzbHlK?=
 =?utf-8?B?RlZPWUZhbjljSlVuTDk3bE02QmZyMmlFa3p6OUljN0cxN1J2KzRFYjZ2VWx1?=
 =?utf-8?B?WHd3bXR2Uy9mZ2JnMFc4TGF1aEwyMk5JcnhKS2UvS0pPa1JLbGdrWHRDS1pX?=
 =?utf-8?B?THRnUVlXc1JQaVlPMVZhKzB1c0RkNkRRUTJtL3ZkZXhaSW83Z1NHRVFZMVJZ?=
 =?utf-8?B?elRCNTkrR2pxVUxhRS9nYzFxRWtMeDVwVm5nTE13RmdJOXRLT1Q3TDMrMjVI?=
 =?utf-8?B?aFh5emVYdHhjUTdYL0J1dFNwMW1sR1lVejhoR0pQTm0yMGdTUTg5SUtsa2p0?=
 =?utf-8?B?T1BIOWhCdmlaV3JteFJPYXJaQ3hZWXBKYTZGUHBmSWtJd3JGcmtmYzN3SWd1?=
 =?utf-8?B?b1ZvTWVoRDF0T0MvMStld2RwaWI4c2tUaGRJWXZsalYzUStiYmhxcXlHcEVi?=
 =?utf-8?B?TmZIL2R2OGYvVWdHQWVuTkdKZVNhQUU0eHc2VElxOTBTaHhzU0xySVVqTkov?=
 =?utf-8?B?VVBaQWNXS0F5V2ZmY0NFeWJPTitKRnlianlSQmpuSENVUFoycTRnZndLeG5P?=
 =?utf-8?B?eFpQNk50WjdvME1lMGJRT3haSHJ1MjdSWml0VXNHV2NqL05UYk4yTENmNHBY?=
 =?utf-8?B?NjNycU85THpZSGhETk9TakdITFpzbHNLb3FhUWthcWxMcGhtK3hOWEQzQ1lU?=
 =?utf-8?B?c3ZIRmtkQXNtenNpanlVQmU1c0dsRWM5elhjaGpYZitPNzBhY1pDRXVFN2hq?=
 =?utf-8?B?UGs3QWw4K0RicThsZUxsSWRaZ25HSUsvc0RKSnNnUit5Rlh6Nm9CaUt0WUVv?=
 =?utf-8?B?Z2ZOdGc1L3NLdkovWTFrRUQzek1Bbm5QU0dMbkVpNUQ0UHYxWnYrZDRTTEkr?=
 =?utf-8?B?czJqVFNaaTJua01MVTMwZTBJUVZDeXJFNVBHNlE4aFNXT3N1UGNIL2JXNVVJ?=
 =?utf-8?B?bU9iWWpFSGl5MGpJVFpHckVacTlGZVZqajRmWnFCdWtwNzY0bllxTGl0L20z?=
 =?utf-8?B?eGFqa3AzV1FMeHhrMDAvSzNUUStLTVBMWXFXQWIyYzdVVFVUb2lnOFk3Y0NC?=
 =?utf-8?Q?8rgNjarDqw+/JJ+yPxxXEKPrg/OyGS21zIShY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QjBRclpvWURiUHdsQjZuY00zN2lKTFlCZS9QSjdPc3VxYVZVYnEwNzZsRGZE?=
 =?utf-8?B?bHRPVjNWaHJLbUg2YktoYVhqYy9XSEQ2OXlFM3hqRmh3SUVDOEVNTm5jTW4r?=
 =?utf-8?B?aWhtUE1LcEJ1bkJPREpReXc0bmFabURsRU5hcHlKVTZXNzRhZC9WMnRNSWNj?=
 =?utf-8?B?K0ZzaS94UGFubDV1VzRaRi94cjYzdkt0ZjhPR0Jqemdkemp2ekFjTUc3cy8z?=
 =?utf-8?B?NmpBbW54dEVHZkRQRmoxZFhZL2U1NkloY2VPSVdXOXpNazlRaWpiODFRWHlN?=
 =?utf-8?B?MTQyVVlZMXpuc2NlYVQ2WU9ZVEx3MTZReE1HdWNWMU1Fc2dGcW0vaU80NzV5?=
 =?utf-8?B?UlAyYW9KQ2ozU2dXcjFpQkpUYkhXajhnbUh5cjRUd2JLZjlPd0JsUEliQ0RB?=
 =?utf-8?B?MXFPdnJWcnFHMVZGb1NwVGl6WVdDRDBCekZvLzNNMEF4QndYVHBaeGJ0SVYw?=
 =?utf-8?B?NjRUZ2Y1WS9RVEU3ZlRueXNBVVFlME96bTV0UXZKWm15cjIzSFNHRjlHWWxF?=
 =?utf-8?B?cklXcFcxNzhxMzgwcmRPaHFkVklHMHNhenJiMkNHVTJSWjcrdUJ2Y242eG1J?=
 =?utf-8?B?eVRSNEFyaGZrbXpxdnpiaXJEemU3VXlvNWZOMWVLbURVV0pSNkNOemNDSHBU?=
 =?utf-8?B?aHIvTG1DMkNYOUIxSHBNUEVFN25VY1E5NWl0d0JZeFdjNzBYWVdrNjJjb3RK?=
 =?utf-8?B?WEtubHVIcUFXTXRZb1FzWXJyR2k2a1ZNM1NESFlvVWZhUFdkVUEveU5IUUZX?=
 =?utf-8?B?QXZFQjBDUDNCTlQ1eHREV0JFR1ZRWlFiOTJvMW1QOTRJZEVhbzhRdkM5S3hY?=
 =?utf-8?B?VnhBYUw2RE1HMmRJeEw1dHJuVTJTeGg0QVByU081ZkVpM1AvTERrT0s3MXRN?=
 =?utf-8?B?NEhWYmxqOTRwc0t4MXZiWWZjcHF6cXJTNlBOandHamoyMGw5TUhZV0xJQnQx?=
 =?utf-8?B?bzdyMDZlUGJITTRaRHlJTkoxdDl0VmxLTC94eEMyT2JhOTluQlpIeEJrVFhp?=
 =?utf-8?B?RkplL0JoenRiRW1icmdyaHdBM2pWV01ENUVJWlBJOWRhcnVjSThGaGlzcjVr?=
 =?utf-8?B?d2Z0dkxFNWJFMDZCKzFleTZZdFNzTis1R3lvT0tyVW9ndHNuc1NjOU1OWXhk?=
 =?utf-8?B?SDYrYjlNQUtNVHJWZ2FGL2xZQjN1UkRSYU1CYzdnc0Z5UFVCeFh0aVE2TTc4?=
 =?utf-8?B?ZGw4WGVkalJMOENHbFdUcFQzK0tyM3g4b2l4Z1JzL0J1NURTYmJ0K0duWlc5?=
 =?utf-8?B?OXhVSkRzTUhOQ0pGSFpQV1UrYTRSWFlER3doak9VdWRCeUI5cEhRaWZHbDdW?=
 =?utf-8?B?dzlaQjY2NWhnUnVHeWhHcjlORUZkUVlvQlQzY1RJWGE3T0RZL2JEdHAzYXhE?=
 =?utf-8?B?OHNzUXdOcXdzWnhuUXB4eDhJdHROMW0xNk44VXFwRmo2Q0ZmN0tFNTA3NUtn?=
 =?utf-8?B?UnpxdjRzR3VETTBFenRuZXJDUXhES2dHMGxTdkFNclVjeEo2aDNSWFlpZGdN?=
 =?utf-8?B?Q2JXR1dURFRCTktOVFdyOHhOWXg5aEVHZHZEbTBwZ1poUXk0TmJSQk9VNGVa?=
 =?utf-8?B?RmpXY0N0Q1hEUytCUVRvUisvTFNnMFpBUGMrdGoxRlJ3RXRxZUZOTUxNdCt0?=
 =?utf-8?B?Nlhvc3NrVGZlZ1QycDJRNSsyVzlqMUhQQnlVN2E2Yk5LZ1JTTHFUZ2JVS0Rv?=
 =?utf-8?B?UE5pclpQRDdLc1NBSmZVcElJYTAwR2prdEdId3B3anBLbHl4VGNZQ1FzdzJ4?=
 =?utf-8?B?NGd1Tm5ISGhWNDMrOVFJelQrWHdHRnVyOXU0NmJkbUlRcDJRRldRdkRoK09k?=
 =?utf-8?B?Wmo2c0NMZFNxc1Z3aWxsM04vdDNRSFpwRHMxRFNHZlBVK0QxQTl2cWcwRFNQ?=
 =?utf-8?B?S1c4d1RPeWl1TytUdEIrNlNTclFPWW5RVEZNc09RT0ZJWHpnRStmeENjTTZB?=
 =?utf-8?B?UVRHTlVwVC9JSEJiMTRxTVpTV3JoUlBvWHlnbEwvekNBT0NMOFdqUXUzZzBi?=
 =?utf-8?B?WTNxNU5oaXFNTEdFZDArZWdPTmUrRXVRT3Q1THdtNE81NzZaeFh1NTBFRVRP?=
 =?utf-8?B?WnBxWVJJRVM5ZUFRQ005VDdaUG80OUVPNnExK2RvRHEva2xvSXdyREdIbUhB?=
 =?utf-8?B?MGViVHJKQnBFWHhsRXJuejdwYkRrVXJqSmswekZpU3pzQmd3VnhiUlVzbVVB?=
 =?utf-8?B?WHc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9455904b-ace2-4be0-2265-08dda1cc3e40
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 11:54:34.7512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2AtOG4syANWIcdygBZsqNOfOF5mXHB0LLtyoI4rarTtXDDaMd+9kkuDL2cBRqX+kta5of3GPemV/xqI+TDJs1jsHRimENG3iF/TO4Mp2who=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7859
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 02 Jun 2025 11:54:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6969

Hi Robert,

On 6/1/25 1:21 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
>    This section in the BitBake manual:
> 
> https://docs.yoctoproject.org/bitbake/dev/bitbake-user-manual/bitbake-user-manual-metadata.html#variable-flags
> 
> introduces variable flags, and as examples shows usage:
> 
>    variable = d.getVarFlags("variable")
>    self.d.setVarFlags("FOO", {"func": True})
> 
> then refers the reader for more explanation to:
> 
> https://docs.yoctoproject.org/bitbake/dev/bitbake-user-manual/bitbake-user-manual-metadata.html#variable-flag-syntax
> 
> But that latter section of the manual doesn't expand on what was at
> the first link, it uses the subscripting form for setting flags, so a
> beginner might get confused about the sudden change in syntax.
> 
> Instead, the additional detail that would follow from that first
> section is found here further down that page:
> 
> https://docs.yoctoproject.org/bitbake/dev/bitbake-user-manual/bitbake-user-manual-metadata.html#functions-for-accessing-datastore-variables
> 
> but that table is still a bit confusing, as it mixes together both
> variable access and flag access; I would think that it would be
> clearer if that table were broken in two, part 1 being variable access
> and part 2 being flag access explained separately.
> 
> [Note: in that table, the description for "d.getVarFlag()" is
> incorrect, it was clearly just copied from the earlier description of
> d.getVar()]
> 
> In any event, that explanation does seem to be potentially confusing.
> 
> Thoughts?
> 

Agreed. One of the issues I have is that it's not clear why
{"func": True}
is passed to setVarFlags.

This section (3.7) also only states that the variable flags are used for 
tasks, but that isn't necessarily true, as those could be used for 
functions I believe and also to variables (e.g. the [doc] example).

I would also make sure "append" and "prepend" have their operator made 
explicit (.= and +=, and =. and =+) to avoid the confusion with :append 
and :prepend (which aren't allowed).

"""
BitBake has a defined set of varflags available for recipes and classes
"""

is also confusing, it isn't clear what we wanted to say there as we say 
earlier in the section we use varflags for tasks. Probably would benefit 
from some rewording :)

Cheers,
Quentin

