Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 069EEC54FB3
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 09:35:45 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.63])
 by mx.groups.io with SMTP id smtpd.web10.45703.1748856937999515030
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Jun 2025 02:35:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=hWYX6eME;
 spf=pass (domain: cherry.de, ip: 40.107.21.63, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X7xRWIEAq2fiRJaP3Rj3pYiKMg2PDefkpgZe8h3BJ5CspWB/sKNg2fo7f2AKnCVfBkFYcid4pdlgeI5yKYUk3QP/epsVFH9n9RKSyYKGhAP0KRviqW0Cbeo5V75u57zcHATI14D7ja73lIhxrA33G3Xqwm9c/fQG+AoM391Kt94HRLmZ6vACgDbLh7tWWvY+Jhq/eQPg2Cp1nYtKLg7bmVsfzOS19UlG2+eipXjr7BO5H9egO8jX18nzTG01sb10dUTL2s5Gcoc/5SNs5tOH8+b2TJYsOEAQr1gsUzyEpLVkTrnNVj8AmlixrnXIsn7UKG36scB5z4l1yRmSDBMcQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dJ24SvrURzrg/ENNss5BfQHl1jImYlbDnSPCUBhVEDs=;
 b=Dxd9NBXCZnqe9KA5j/XgKI+eKweuiC+M9mJm1JRt2rJYCQl/dCYs6ZbVPkaHNBEJd5lfKvjMRm960KzXNgsSZgfNJp8MjcJk4AAAv9PzDztCM5WxcdYomkZy7cgxWuhEqEbYeL5rX3+G4OUETe/Otwp9nYmHcjN3PwHVruy8ykZQXBnilcWTsLXqByFRkpdVV91jnibKh0rGyr/s4aahKr2HwNUfiUpJYdP1q0DYQe7CPWn+JW3coZHNkCTZQsm7f58hcljAB8+CH3H4CkbTvIrWcd0XFDsHOkdsoVkJuDlztPmOUMK8YblAptFANknzJTH5c8Ak/70U7zLLuGFTLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dJ24SvrURzrg/ENNss5BfQHl1jImYlbDnSPCUBhVEDs=;
 b=hWYX6eME40YKo+Mr5bGaNzWT5m+j304eVIz1afSwo3Pd3ScJk+Ff8ajtqv2ZKR/r5E0i0zlPAQMdxJo42LQT35AMKLwwKk8tFap/CxgNk/b9EkQ1zbn1/2TZzgC6bb0+E0L7w4+58kJpeEaTrRmcJ/uO7/70UGOsdnlVExbetMo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB8039.eurprd04.prod.outlook.com (2603:10a6:20b:2a2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 09:35:34 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8769.037; Mon, 2 Jun 2025
 09:35:34 +0000
Message-ID: <22f9f4fa-3ad5-400b-90e2-475238d30e6a@cherry.de>
Date: Mon, 2 Jun 2025 11:35:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] brief-yoctoprojectqs/ref-manual: Switch to new CDN
To: richard.purdie@linuxfoundation.org, docs@lists.yoctoproject.org
References: <20250529163440.3116537-1-richard.purdie@linuxfoundation.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250529163440.3116537-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P195CA0060.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::49) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB8039:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f6cd27f-1337-4108-87b8-08dda1b8d307
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WFJxeW42VGdNclBPOGpCZUpxL0gzQWt6ZGx4akNrUUYxdHJpTGF5K0tKdmww?=
 =?utf-8?B?amdlQXR4YXBPbWlLeGt3VEdxNGpDb0RqRWpqSHhJSFdybDVHZStpZWswdDF6?=
 =?utf-8?B?blJJbmpUT3RrMkRQN1ZZelFQNU9NNkFETEpEQW9PNEgvVkxnTE5tTmNjRlZv?=
 =?utf-8?B?UGNvOU15blhnekxiWi9sZHh3YlpFT29TSXk1S1A3djJhZDBCZFU2ZU1LaU5U?=
 =?utf-8?B?ZlVtUE5wMG83dCtNanQ5VkJ5b3Z3MG5mM0tscjQxZXp5eTJBN2JIdFVHakxW?=
 =?utf-8?B?REN3RFRaTHd1QS9kUE5JdVd0QWpKR2diTWQzelJJY1NHQms4TXN0eVVFcTVv?=
 =?utf-8?B?S1NQQ3NLb2llS3ZTL3Jrc1Z1RnVVVXJVZkc4UEU3N1VxOXdBaFJ3VkhFb25j?=
 =?utf-8?B?S1pUclNzVU1NUzQ3UWJram5lZ1p3Mk5lRFpHRWtqUFd4cWR2cVB1R3RlbWpG?=
 =?utf-8?B?U2ROSSs0QmhUZk9UNUR0VWVwdDFuaWhKSWdNYXBuK0haOHM5TlZuVkNnbExu?=
 =?utf-8?B?bXQ5WDRDcm5zZEk0S2tUVm1wK2k3NmVZOEMxOHJPMlFlSk5DdEkwVnVuSkVS?=
 =?utf-8?B?MHhVYURJUngvYUJreDVEUnFtaVk2eE80WGhmNW1BNEIzNm5aS25UWExUT3ZQ?=
 =?utf-8?B?UUNvTVQrMkl1RDNKcHduMllBZHFqNWFwZHB5NDljNnE3dEVXQ1JkUFdUdmow?=
 =?utf-8?B?dCtQR254M1FMQWc4TFp2QUhpVHV6c3RmUXk1aFh5dC8wR2gwUjRJRHhxUE1J?=
 =?utf-8?B?UEZHQUpDOWFEVkpzQTByRjZXSHFmdDJqeU01NWIyL2l0VzZYVG41NHc2c3do?=
 =?utf-8?B?K0M4bDc1SVJuN1BLeS9lSDRBMlBRQmJZaTR2bUJYOEhWQTd0Tm5UcEhFcVRG?=
 =?utf-8?B?ZFNJYjNjeDlpYkpwMmZPd1dJRG9DL3lFYUdKZnpuVGk3enFXalFaaXd5VHJE?=
 =?utf-8?B?NXNOTERMczdJQ3JuWm5tdHc4MDdTeDFGUURJTVB1M0ZoQVp3UDlvQ0svQzVv?=
 =?utf-8?B?bFV4V2E4TDhRVllrZlpqUjZJaFBsdzBFVUk0SnVsZXVjYlp2d2Q0YncyL09L?=
 =?utf-8?B?WVg1VXpLZXV4S2lOb1J4YUJIdkc3QW5IakRoT1ZkbUlZUytrdU1GSTNZTits?=
 =?utf-8?B?OEVWMk52eXpVOEg2MExrR0VvaGl1NVMrcjdtRVUvMnI5Nk1CSlRUbWo1WFdE?=
 =?utf-8?B?dW0vZ3M4bkprcndtY2pJSjIvemhJM3hUVWt4VGdhV2pPSmhSbVNIMVpGa0Ev?=
 =?utf-8?B?eFhMMjJ2a2lOZzFNb1N2NG1PdXdzQ1I4TVVZenc5Ty9mT09RTWIyYVJPN3lD?=
 =?utf-8?B?Mjd0VElodlJsbDJ6L3RPQzZWb2srdUVFanRmOE9MREdOZFNDUHZWSGp1eU1V?=
 =?utf-8?B?N3ZMNGRlR2JkWUVYcnBZZ0pHRG8yZTlqKy9jTCtrcG9xSm1KK1o1QjFGRkl5?=
 =?utf-8?B?Q29oemZzalArdUY0ZUpMQmo3YUlQZWN4bkplZWp1SXB2aGNGSGx3N3JpdVV5?=
 =?utf-8?B?aDlCRTdoSzU5MHpLeUhSOXA3MndJSHp0empobDNKSCt3M0M0T1o4d2xOOWlM?=
 =?utf-8?B?QW9UV3paMjBvc3lGZXZqZk5vUEQvRDlUckxRZXdQVzlwMGdIQ2JlMEg2U2FG?=
 =?utf-8?B?M2ZUQnBrK01oc1FKM2RGLzBIYXE2aEFObVVMa3Qva3JCWVQyck1XTWZFUDlx?=
 =?utf-8?B?c0xLektvNXc2V2NsZlRhYjhwWXNGQXg5MUIyYVMzVW9ld2F2MXcwMXNBY2xm?=
 =?utf-8?B?dStzODFScTQ2U1h5OHQ3cHV5Q1hra1Z0c3p6OVJxMjFaSEVzMVV6NHh1dG90?=
 =?utf-8?B?SExFM2YxbElSNTBqUG1wMWgwU2F3eXBZYkV3Z1ZXNkI0U3kxVk1KR1kyb2Vy?=
 =?utf-8?B?dm45bVVJSEdvMEtuOE1wY3pMOEora3cwTlRuK0twVlhzR2ZLdXBuYlplUkVC?=
 =?utf-8?Q?oqkBx732lL8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?T1p4Uis0dEJoVEUxeHpaSUVPdlJiVDduMmpacEdKeHRJRkxQNlFNTENKWUxB?=
 =?utf-8?B?WTV0SkQ5UWNpU2pocVYzbHZQK1JSdlRXOFZIeElObmQzRVkvbHpNYVhJMzJm?=
 =?utf-8?B?dEN3bHRycTdDL05IMmh4Z3ZDVzRRSG9DaEc4c1hCZHBTOTJJREEvcldDMHZH?=
 =?utf-8?B?N08zVkdkaXBtaVZUUzYyWFl0MWlpVUtuUFFINWZRVlZEdzdYeWMrV1N4eHJZ?=
 =?utf-8?B?K3VFbjI5cllLUFpuTGsvdWpSUXdPVGVlWnBNSlI5MGdENjZsM1NMZVh4Qi9x?=
 =?utf-8?B?MGNmWktwUTd2b0VGdmd2WFVmUmlRRHZsaHlTWDJINjEvUS9ScXJxZFhUWlRP?=
 =?utf-8?B?VVdPSmZxRjlJeERSaTd4RkFYbFNBS256STZQRFFGUXdrakQzRVByeVEzL0hZ?=
 =?utf-8?B?NmVDSmhEaktCS2VjMkpWWHdPYzdUY0tBQXJqZDZLV3dNZWFUYmJyaDRnSVFK?=
 =?utf-8?B?U3pqeFJ2dmQ5UU9HbngwU0FpaUY1Z08vYmpiWVhBVzJsN1duZDNpSWlGQUda?=
 =?utf-8?B?eGJKQk1XaWdFZGJkUVl2cVVVMG9QQXRUcURyRWNkOWZaMmZCcGhRRVpHcUpa?=
 =?utf-8?B?MTh1Qm1BQWp2R0xEZFNyQ0J6MUh1OFVPZS9qZUVEZTR6dVlBQUZocHVyY0xD?=
 =?utf-8?B?SERHdElyeWVWTG91aVMvSGkxbk5EVGVNSmw5bm5HZ1FtQklnd2hmWjJQaExD?=
 =?utf-8?B?UDZSYThLbndXYVFjRWN6U3RtQ1dtR3hpY29tdmJVTTM2ZW9HYno2Q0ZTWlZm?=
 =?utf-8?B?K01MTEhlR215cTdpMVNlQWt4Q2JJUmFkMVE4d0luOXBRVzBzcmd4TTlZQVZM?=
 =?utf-8?B?aFlHTTBwc0dRNmNDcHVPMkhDLzh3bzlrOHVOK2tFa0dOZkVwNWxQY0dSbGFM?=
 =?utf-8?B?dXZKdkM2bUFyNWRKc3pxRGxsaUYvQU1tRnlPV0VrTTFSdmNrcnN6ckNzdmUr?=
 =?utf-8?B?ayt4Wm5BQlNMUW1qeEtaMU9NOG1mKzI3RTh0NFJYK1d1OU4yTUIvdlhJOTlR?=
 =?utf-8?B?RTdVVWlVbXozKzZ1MUlIcFUzTTBYb0QrWno2SzEvd2NFVGl0dDNMd2NmWGVI?=
 =?utf-8?B?M3plZGFjK2k0SVBEMDc1eVpPcWFORk1lMk5tNFdIRGJ3Q0JENjlQV3BMY20w?=
 =?utf-8?B?SldUblZUYTFqUktESU9WS0ZiQTBnbXUxMFh1RFp2c0NMK0tkcmRSUG9zRmhi?=
 =?utf-8?B?aVdBaStPNXZyZkRod29OWVV6d1diT3R2V2I5elNwWFpNOFhPL1pLNXRWc1U2?=
 =?utf-8?B?YU44UmJnVVBWR2Q2cjdQYTZXQUl4R1JBNy9QemVQaVAxcVIzamh0RktQcVdM?=
 =?utf-8?B?dWZ6enl4NUxRaGFVZXVGamtNOTVqbWYxMkVkNmRvdkdaaS9HTXVrRm9CMkd4?=
 =?utf-8?B?UlU0Q3RWVE5aby9FUEk0MUF0cTZ6U3FyR3B5QzNlMTFZUjJoNGc1V3RnLzFB?=
 =?utf-8?B?cElVZ1BTTjJxc0g5SDMvM3Zpc3ROeWJ4d0tXUWVJYzNDRWhPZzlCKzV5cWto?=
 =?utf-8?B?VHRKYXR1M2dqTTdDbDltejVZQ1NrK3dMei9kdmVaQkJqK0grMU9rUVNETkV1?=
 =?utf-8?B?NlN1TlpMcmx4S3pLSVZ0aW1XUGE2SnFKMFN4TWJOaERCYlZpREJaL3gwbTdR?=
 =?utf-8?B?QVZyWnIrUnZqcEFkZ3Qxb1JuZE1NWnNWRUJtUUxjMTZVODV1aXMvaFhWOHhl?=
 =?utf-8?B?WjZlVUp3OUY2UnprWURndm1KdlRXYXlDVnBnWjJpSXRtVFNLZWI4aytjM3h1?=
 =?utf-8?B?QjFybXc2dGlraTIvcHU0RkovSXVNN2pzc1UyQVJFN1pwSlBQYkJ1U21TazYv?=
 =?utf-8?B?OHJwQWJ5UzRMUmNIUUhQTXBJQnNOcDg3dHhzWVZodHZ5ZVE1V1BpVllqMldV?=
 =?utf-8?B?Tkh6Y2h4VEpNMnlSdXJnWXVHQUowRGxaVGFwUHpabFpjakdjMGV2Nk9JbmJL?=
 =?utf-8?B?WkRuSlJSWjdpTTA2ajZzcm9zdEpsNUxXTWxVc3NmNDN6VmRGOU5jeHBXRnVJ?=
 =?utf-8?B?NWkxR3lobHJiMDJocXlVWTFpUEhZS2hERGZVODhISHV2T0VMaG40Wnk2NERL?=
 =?utf-8?B?ZU1XU3hGNE9jamJhRlJTei9oWjZydUUvbU1jWlg4UEJnbkZQTWxzL0F1S3Z4?=
 =?utf-8?B?QkdNNmVtRDBnQk5BekNPRXlBYVVkeVZGSnlQVWRBNFo4R25tSkRzRDBrckRo?=
 =?utf-8?B?YlE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f6cd27f-1337-4108-87b8-08dda1b8d307
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 09:35:34.4791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oELM3JCvXq7UQoMAyUp597qQTZVf4RScRvOW3LPjjiMZlDPrDybY6aJSE5eBs2W/0Hxb1MUUaHF6kkrOadzxKicCp/HlwQb7fiOyuK3CXmY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8039
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 02 Jun 2025 09:35:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6961

Hi Richard,

On 5/29/25 6:34 PM, Richard Purdie via lists.yoctoproject.org wrote:
> The project is switching the way handle our CDN provision of sstate objects,
> update the URL accordingly.
> 

Will the old URL still work for existing sstate? The answer to that 
question will tell us whether we should backport this to all/most older 
releases I believe?

Cheers,
Quentin

