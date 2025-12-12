Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ED74D44174
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 10:31:14 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9906.1765535467061482479
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Dec 2025 02:31:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=iZuE/nnv;
 spf=pass (domain: cherry.de, ip: 52.101.83.12, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BU1FM8j+yY6MhhvL2BKqbEJ0Z6le//Qx1Lrp5FBKietGBUUQIswXwJ04tgoY0SP5jgdS0SXWLYYf8PY731zv9ipktq7O604n6MfmZ8xl5UBf5q1IbFE3mego2ieFdP3bI6vO6erIs3DEAC9NOhaoMS6YR+Tr6NYmE02KUZZECFkx62att7VBRZV5bO+vgW7hgeX/RG216gK1qVwmELLhScCsN+1akzkSLbT+Xa0wA7T6jZ8CEAIfzpO9rlrfgIpfgD4kHt8pRHE0DdqnPYO/QoO6qCszbV5PG45uG9amboVzgIWwErUYfM49xVUPAJ/EotPIYLGImmxUW1P0H92wRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dj3y5j0lHGhwlHZnCGWl9k4XN11sPLM8swKrnVvW4Lo=;
 b=QWFJCePmeTw4ule0kEt4uvuf/QcmiHxhf9Wj0mBQfjccAdeaSkFsRHSuL912bWftJU7yB4p/xPuYYDMMHheXs/Drr4fgL9kV8FiRfQw4Uc/YFzADs2zv13EUtdb8mPpwutTFvj7uisqX6PiBkxidAe6pb41nRQOEDdzxlw/rBYI9sYta4TPXdCYMw5qkMeeMm3EekxIsFqi0eSBj36O31eGa4J71EDhPvVlzf7/PBF6U5djf/OMD9PAmNSMnv8vcIFR/5F9w5b6JNM77wfFQt9aZaRZs0daFhEi29N9pPcyodJfkPEL+fw03u/BDK8jcAGACoIofO7El0fdXJUzbJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dj3y5j0lHGhwlHZnCGWl9k4XN11sPLM8swKrnVvW4Lo=;
 b=iZuE/nnv/bb0GkwnVRI5H0CO3hSvV+T5Xo9m80GSluBnGO+kapaYmmo0wXBgfnDqIHjtqLkQBJ1XTnOpfpjDvb3MTnZA7NoXs30TvRelA9/Ld/c36uM5q0DLRw8uelNKYni+9+SbmL9tK8VwhHr+gtUG7CYezY794kGcJRR8nDw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AS5PR04MB9875.eurprd04.prod.outlook.com (2603:10a6:20b:652::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 10:30:50 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 10:30:50 +0000
Message-ID: <4f3a8761-b4e6-411b-9b1d-6028c7a5a556@cherry.de>
Date: Fri, 12 Dec 2025 11:30:26 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v3 1/5] tools/build-docs-container: move container
 files in their own directory
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251212-build-docs-container-tlmgr-v3-0-a45c1ce6d8f7@bootlin.com>
 <20251212-build-docs-container-tlmgr-v3-1-a45c1ce6d8f7@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251212-build-docs-container-tlmgr-v3-1-a45c1ce6d8f7@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P191CA0004.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::10) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AS5PR04MB9875:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b4674c7-4906-49d0-5fcb-08de3969853d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?REhvR0FvS1JRYU9XcUNtdkJmTk1QOHJIc2tsM3M0K1RYaDRMTis4WjlOVmpD?=
 =?utf-8?B?SUVSQVBUbWh1WkJYZytQSGtReXRrcUZmM2orQm1JSzdVMGdLN3l3KzJ6ZGV2?=
 =?utf-8?B?UVdwL3QxQmFrVTJxeVFSckhIN3dIS3I3RHNXd2VqV05nelkxMDkxRzlJQkM1?=
 =?utf-8?B?YWc3QkQ5ajgvL25BZVh1bjZwYm1zVUFpQzI0VnVXSThsaURzRy9KNGVlcTN1?=
 =?utf-8?B?VzFITUVYNllDU3ZvSGROdDBHajNEL0tuV2RNRjNnemJtSURidWMrNXdpWjJa?=
 =?utf-8?B?dkNJT2VMSzZ2MkFISHV3K1NjMTExNWYyZkx2MWUxaS9xdTk2Sm1qRzlWSUNa?=
 =?utf-8?B?ZnV6a3V1WG0yNDFWRHU1TnRBZ1Bjek9PSGZYZkZRRlZub3ZYZjVyMjJmK0cy?=
 =?utf-8?B?S2R2d3kvQjZJZURia29ieTIwSHNyL1BqMFNuZ2tQK2MwY0xPWjk3UHowSWN2?=
 =?utf-8?B?ellYanZZY0FpTCtXTlRTU1BtSUZsb1lKallSNzg4L005SldyRHRLckhJWGli?=
 =?utf-8?B?Q2ZzUGl2WU5yZVdwc2wzaHJTNTkxTVFSaGFJencyOHlCWDlVQlB1QzRrZXZU?=
 =?utf-8?B?c0ovTDExaUJwMGZlc3FoeUdHRmVuYkl3bC9ROXVldWNYMmNDSVd3dUJPcWR3?=
 =?utf-8?B?MTUwYzZxZlRiaEpNaEthL0IrZW1aMnJMZVJMK3ZybVNmZUkrY2YweFREMzYy?=
 =?utf-8?B?ejAwQU05WVNMOWdhOENnWWxBUThEc2szeWQrMGhUczNFd29icHVvUUx6a040?=
 =?utf-8?B?VlJhQ0JDYkI4di93cWNFZzZvdVNmaE85K1dBc0twNDF0NHI0azVhODEveTcw?=
 =?utf-8?B?aEN0b1h2UXBoOGhudEhCQ2xPYlU3VHNjV0pUYTdQNGhlbi9zWmlrV1ZicXJE?=
 =?utf-8?B?U0wyanhrVTcvRVVKTllicWRuQWk1NFZKR0VkQXVTVUhEOFFVSnBhZC9pZ1J1?=
 =?utf-8?B?Y3lPNmlCVTVzSHhBRkR6MDdoNTFqUmx2cnFaWnQ5V1F3ZWlPVzZGUm5ZeERl?=
 =?utf-8?B?VVRoZ05uaC9KeFd3amc3a0hUajJReDFnNWR2L20rREhzNGh1VDlwd2ZWNGkr?=
 =?utf-8?B?TlJDNEpHemVUNVlEeHJEUVVYcE5iN2VNQWZmTUFGa2ZNQkRIemNmdUsxMUow?=
 =?utf-8?B?dXRVZ1BKSmlqVEF3cGVkUGxyaG9pS0pCVXlDRTBTWmV3ZFlZcjhyWHZnVzc0?=
 =?utf-8?B?N1p4WElOd2NSZ21icW1IdlJLbVYwc3BibTh5QklrOUNabGhEWkVNQWQySEtK?=
 =?utf-8?B?STJ3aW9yVFZzelBlVHlhckUyZ0RFVkM1MzRjdmwwNVhhdVZOZkxRWnB3RGhl?=
 =?utf-8?B?MVVMZUV6WGViUWZPUUhabXh2NkJnd3VTUFpha3IrUzEyRTVPOGR4cjhFakdN?=
 =?utf-8?B?NFZra1BIQ2sxbER0RXZxRVhudG5pUDExWjRaeVpCRkpUa1N4NjlPWW4xYjVL?=
 =?utf-8?B?R0s4ODBJSndjaENQeDF3UjdTS1FuMzNqaXlvRDFXaTFiNmY4OUNXQTVxUUVw?=
 =?utf-8?B?RkVxeHozMTFVbkgxVmZkUGsvQjNKajdsYnNKQlFiakZUUHpmeXdKNUo1ckJk?=
 =?utf-8?B?RWkzZ09YWEhRQ1Z3NFlBTWJQRjVPeWZwZXRSUGEwS1MwVm5IdEdidzNNd2xY?=
 =?utf-8?B?STlQRytrVVFETjQwbE1nWWFrOER3dThtWHFCK3BJNmE0OEp1T2VXTnB1djFl?=
 =?utf-8?B?WXVYT2JGbGJTckFUanBmeEFhUGFrdW9mbWg5SEx2TElDMDNraXVYRFk2QlhW?=
 =?utf-8?B?bm1MSGhUYTl2TDRRZnhtQTlFNE5OMHpnd1pvUDJOZEhtMEJhL0Qyb3hhRmM3?=
 =?utf-8?B?bnJZY3dId25TOU95Vys1eXM0MDd3MWtFSXpqaHFWMjgxTTN4dU1UbjZEc2Y4?=
 =?utf-8?B?Ti9tWldhNkg2R1pYRzZUdzJVQkJ3Q3Y4UXF0ekE0SGFRRXVqeGFHNzBnb2Ir?=
 =?utf-8?Q?raAdlpom1Weyv7da4yGW0CbDoCr0LsE7?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ckpCZ3lHS2JRZSs0ZlFheDlCY3lCQXUxSTdmWXBNOWhkdVVDVjRKUTEwa1po?=
 =?utf-8?B?SFY4endqUVlYUll0N1lPaWIwNXNPYW55WGZlbFJZemsxS3Q0NjV0Qmk2QzFs?=
 =?utf-8?B?LzFpYjlqRGVLSU9mU1VkRVdvaFRVMkptQUcyTzJoS3pxTUM5L3NtL1FRWEQ1?=
 =?utf-8?B?S1lKNThPd3NMd2drR3hxY3ArT2p4eFAwZXpWb0ZSTE5UTDNqUkFiVU1TN2xo?=
 =?utf-8?B?cjVKYTZadW5pbHlLZFFaNWM3b2gvOFd2SW1SdmZNcTJGb0RQNitWOWRBOFFs?=
 =?utf-8?B?UGdCNjB2dEg3aTAvRjZTMkU4SnBjekNFNnpUSGpOaWE1cjFVU1krL2Rqa2Iv?=
 =?utf-8?B?S1RDNUZaS3JwaEN5ZytoMGpKS1FlR3krSWovbFROUVZNL1VMVy9Dbk1DdFM2?=
 =?utf-8?B?TktCYTlRQithUVZiNmM3cWxOV0EzZ3JQbzluOHA5VDl3WE9iY0RQYW10Mk5E?=
 =?utf-8?B?QjcvaFFmVzdRL2p6OEN6MC9oUEM0S2grN1ZVVHNRWGpHVFhaV0NhSTFWU2kx?=
 =?utf-8?B?aEVGc1c2cjZaNTRIYisxQ0FIZlNnR1ZEWE1YcVJFdEY1eXgzOExDNHcvWFRI?=
 =?utf-8?B?bDhDOU9KY29PMUhMVndnYnV1cnFqR1BZelVoWThLbk14d0VodHY4N1MxRlFk?=
 =?utf-8?B?MEhzZ2o3d2Y4bzlQc21GOGxRcjE5emVzcjg2VENPQTE2cDcwUE44Y1pZdnhj?=
 =?utf-8?B?enJucHhWRDZlb1Ztc2pMREtNQjFFUGpwZ2hDR1dNSzRGb1NJL29ubm92Rllm?=
 =?utf-8?B?VFU3NlhZSnhURUMwWjZuTnBFQ0ZXUmpoK2FnTFBHZFF6RThGZW1aMnlhRDM4?=
 =?utf-8?B?V25mZ3NTS0E5YVBYNFRQQUNrbVd2WmQvRmI3ME9oK2FYQXo2TDdqUVFpdHVV?=
 =?utf-8?B?N2kyVUVHdlVjMWZIL3V0c0IwOTBrdnJTYXVSZ3UzL0ZEWi9LQnVHaFFSN1Rv?=
 =?utf-8?B?VE9iYmFCNTBEemZGNXVYOUh0NzhzMGljbFI2Rm5PK1pSTWFSaDNEbzJoTmQ5?=
 =?utf-8?B?WWtPU2h1UlJJUjFpSGUwbnU0aXAxNnpvK0RrNi9LQ1d4NkVSV3E3TDFwZXZD?=
 =?utf-8?B?WlM4WXJYK2FVUmJSUmV2Slc1UDBDZ2hac2lTRTRmd0NxZlZ6K1dDckNzZTBj?=
 =?utf-8?B?RlRFdzJ3QlFmbHZxdGZJaWFYRlUrNjkrTi9Ia3pycXhWd3ovQkp4ODRUV24v?=
 =?utf-8?B?a1NVeDNXR2dZeTdaZ1drOXVpRkUxbVRvMkNhQkoveXNKMy9JVWlPelFuZi9k?=
 =?utf-8?B?ZnRNTHdlT21XVjh3YkJMTS9yWUUrVS85by9sOGVSVzdiMzlkWXN0UVlPTFlh?=
 =?utf-8?B?UlpnN3JDQU5UdnhUR00wMjNNbGxJS2pJQ0FZUUk1VHlnU1NrRXNwWVNPbmVm?=
 =?utf-8?B?NG00a0ZXaUx1RStVeVZsWTRXa25sMGZRL1lrNklXaGFTSTFQVHNQd1k3NW9y?=
 =?utf-8?B?VGZnU1VLS0I5SHNaLzhZcno0V1RQam9HdCsvNDhBYzhrRUJSVDFqamI5UTF2?=
 =?utf-8?B?Vm1CRjk4Yld1R2prcU10a0hEVGtWRktBZnZzRGVkZ0h6dERlampucnpkTkFu?=
 =?utf-8?B?V2V0cmYzaXM2VzBhOWJDOVA2Y2RVVFpIZkxIcEJBdk9YNUpPeFNGUTM0dm1S?=
 =?utf-8?B?MGVKWVdRS1hGNUVBczBQbk5rSW9MNXVxTGNzeW9ZUlo1UFEzWHMvN1N2Z1dn?=
 =?utf-8?B?TXU2QU5wQ2NEeVhXQmQ4MkY3bjgyYTVuNHJRWE9CN0dZMVBaQlFpZ1lDMERD?=
 =?utf-8?B?NG42RG81cXNQTmluUURKUjdLcWNUMEhmNFVxZU9EQkVFa01yTVp5OW1VVG1v?=
 =?utf-8?B?ZlA0MDNwWXZ6UjkyaTlMTzl4cHQranduWjRmWkVoWjVEN29oT2tPU1YwUmI0?=
 =?utf-8?B?WXVVWE1GbnBDZ1lKZmQzajR1SjBaRnd0QzNwajZYQkl3RlovOVQ3aVhYOU5C?=
 =?utf-8?B?ODhaR3BIV010OW82SlUzWjRkS3RWRzQ1VHlweTh5Vm5LcWFOcmhvNkdrU2s0?=
 =?utf-8?B?SlBYYUNqb3lZTUVBWlhDZHRSTkFlTk5tMms4SFdvSENyMUVPTzF3emNEaWtI?=
 =?utf-8?B?KzI3dGdDUSs5MWFnRjIraGsxYjhZZnE2SmxjdDVsOTlGOWZWZnlhMDNmdUZU?=
 =?utf-8?B?dVEyblM5SXhWdXRIOXVCTWk4ZFRwQnUrUk1NaXhBT1FpMTNTemxwcitHMTMx?=
 =?utf-8?Q?/NdlLuFopB/kJbJbnhAnreE=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b4674c7-4906-49d0-5fcb-08de3969853d
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 10:30:50.4372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pWvgL0eCrNfomM7HuRP9gozXa1ATa2zY4ZC3N3Ys90B2LYIh3ROam4voe9klo5ebdVkZY2VYyN0uHOEAxgZytD5c2ad7DuNyA88ePLvNHOg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9875
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Dec 2025 10:31:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8267

Hi Antonin,

On 12/12/25 11:22 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Create a directory to hold the Containerfiles as they were lying next to
> the scripts. As a consequence we need to change the build context of the
> docker build command to build from SCRIPT_DIR and pass the host packages
> scripts and container file relative to it.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

