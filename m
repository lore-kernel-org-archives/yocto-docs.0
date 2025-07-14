Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E28B1C83F1B
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 14:48:42 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.28])
 by mx.groups.io with SMTP id smtpd.web10.79987.1752504519122708906
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Jul 2025 07:48:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=kKdspR/k;
 spf=pass (domain: cherry.de, ip: 40.107.162.28, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YsipE5A32cJJB2ePHmCFATTn1coeUow1DvK10jfbRf1tkmou/PY3XeOOXrGZSluQe1Vf+XTBa+xosDPrssN0skDN9F3NWDihk1bFo4KLuzb2fo/TsEQqvBC+zxbNe0Ae+krzR4PLGRopfVNA4hIW6pSZ3pK9vE0DFWSKx7FHK16CAxPdA9cT6BhC8FBt4GRclCSxqZnPVBOVUhDj440WClPqRMuBRa7m0QsendJVXHO58RX0AQjWBJ676O2tUieYQXX0SuNKteZKQ+stvLaK5/B14djypTMY0Yz5ZUobZHqdeNo0qXbYnofJlsTj/TNOJ1ECqvzPiQpFDgCFjvUXDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GobIKjHOoPUajNMNCtSARdRzJdYbNoxGTHdVAEOkAKY=;
 b=Teo9j8cGE9Sqk6ke320hBocG9jPsytqyKXxIy0dT3/4k8kMNMG7eUfziemhY7SMjdrO6UNyBCJ9qanGXuaMGyYcRbXBrEt0gU9xQLcykfSsVWtKEIoe5y8OUvndM6Dk181KBsmRXmpSuVHXLBP1uAaQ1lZnNsOMdVmP45qlZhcFRrk/08PZG5qiu8vhaIXBcDJCe+C9s9goDySilH/eWidocIBvwW2sH91FENvm1om7dR5l5sqJyheui8WAWaKZWYS/WhmfRgSZSclyEwNcl5eD4+thh4BNWdMC2DbiHaj4Q7XhV5Pg/5V/O22QerKe2okdu72JOj9VxaMYnHUrQhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GobIKjHOoPUajNMNCtSARdRzJdYbNoxGTHdVAEOkAKY=;
 b=kKdspR/kickTG1z38j24b0zwgGDYNCQb8J6e8M1lsYnOVl3ojvt9n52i9IAaGrBfJZN7JDG8dH+p28ycfKCRnmtkFIEPuxQhjf/gfHA/Q7pcQNzUQn1L+kqc2I6tfza3fN9eFH842CqfPnDK1hWhHQxrW2atgDCZrjwlOf7f0mc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA4PR04MB7774.eurprd04.prod.outlook.com (2603:10a6:102:cc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Mon, 14 Jul
 2025 14:48:34 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%4]) with mapi id 15.20.8922.028; Mon, 14 Jul 2025
 14:48:34 +0000
Message-ID: <395efa87-09ed-4bb0-ac63-a5e13909e556@cherry.de>
Date: Mon, 14 Jul 2025 16:48:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] perhaps "DEFAULT_PREFERENCE" in BB manual needs a newer
 explanation
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <ebacaa46-9a35-2952-0857-3b9d75fd24e1@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <ebacaa46-9a35-2952-0857-3b9d75fd24e1@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: VI1PR06CA0134.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::27) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA4PR04MB7774:EE_
X-MS-Office365-Filtering-Correlation-Id: f3f45627-9bc3-4b9a-217b-08ddc2e58227
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?zR1Aii3RzMl7mtSLBAdl/TqYELksNEorVdqDqiyMrPXy39M7InJ3EK4FeA1v?=
 =?us-ascii?Q?YxiSEQFf8siJ6PGEWmKZeUjopS6d4w4Hoas7Kwl2Mz+a9Z7/qcwIAP99jZxv?=
 =?us-ascii?Q?mT4u27YKDU60a7CmGLns1VZrJOLW1FZ/COwGdC+HrtVlPANPQX830FlxI5qD?=
 =?us-ascii?Q?WDbfKeYcje8RecA7BwET8O4FpkxSpZr4r7bThXBVz8iCTM9NZBoR/ljl6kfn?=
 =?us-ascii?Q?Vb58HKa9ylQlsBSY1kcFeG5/DKfKFQ5MaxOv0kiubdnOkImA0dIo034TKeeI?=
 =?us-ascii?Q?ILGZEiUm+ztXOf1y5qZsOKtE1ECuzUDzvND1gIfiw8ap6bOBHY2er+vXvaGE?=
 =?us-ascii?Q?6EjSNVadbAEEYVrb82Hu8JCORLki35Hj55157lS7qDVx15aGp4qzXpc5CIOw?=
 =?us-ascii?Q?p/B4inBdgzPRSmrur+vmQ9gRrL5KDq6vbpTXWQ88LJ39TR4guXGcMVQ9Yspi?=
 =?us-ascii?Q?W78/UmogzvB0NCItYvwUJCs2MQPBArrE1n/nx21BDCaOZGpKWirSLRiVgYJZ?=
 =?us-ascii?Q?VHnjfewWujG75QOXq/IvY/2CzlwxW+PTU1sJcfJLqSSNXNtlPwbTgjXtPV7I?=
 =?us-ascii?Q?nOYvVfTmPdMP0Qc+XMb/cbWIrQgzmNBYH0kPSemgKWHCw1QKxbtnWU/R3vLO?=
 =?us-ascii?Q?OYoA/TVN2EvgVn/0NJW0uSjrf2zNx0iCYJn6Yh+iqMDNQpIbU16FrNFTbi+X?=
 =?us-ascii?Q?4FUqRmicI+PsMh2I4U5wdL+P5tWITp+ju9xHfMVxdjF0lCFwLeNuF1skJRum?=
 =?us-ascii?Q?/Tk9BO9R2L6wGu4Ikng285KvP28EDIQrj/puTJGuSMllypJWEN4zIWeAZDQw?=
 =?us-ascii?Q?/xjXE5faxPmBGwQSen/vsy94Z37KL2AK+P2TuBjtQSej/FEuwJ/I0Nq45xcJ?=
 =?us-ascii?Q?5BTD9dCINuVXNrSnwRMWV02osCk6ZkbZB9I//S0GEBcIxsBnObfz2RCdAOBE?=
 =?us-ascii?Q?eXskhQKNPLkmhA90xPfdf1kVWlyUSusijYxYdVUlufojlVX1ZnGwi1iQhbbI?=
 =?us-ascii?Q?tr5DyMRH2ImkNH8qCHUdRFKD+iv26wbJ1ETby6uqHtRO/+Nx6bEhlHm7qDh8?=
 =?us-ascii?Q?0JWpua2RluyN1WmsfT4Flkvonr9qZAmt7EUjWcfn+sUpb0JgP1C+rAR945oG?=
 =?us-ascii?Q?ShVT7CvXCtqnlKw/a4lphbni+3gs6vAGRABIZw5r57MrMahBdjAfhefHUPdr?=
 =?us-ascii?Q?PoF51nibk2p9+FhBpdvnx80yOnB0+Zb038ijJ0P7XbD5CSzDj+D4+SDhsHt9?=
 =?us-ascii?Q?+uPM+BQBKEBjpwHmFyrJCAto7t3kKkZYxHMfcFStd+tQvIWtv2+1LtQ4nezQ?=
 =?us-ascii?Q?V2anpq8WyR+HWONXyAiFHijUW5m3I3k9OJ+EqxkuN8fw9PZt4S8Qb4YUe8gO?=
 =?us-ascii?Q?n3j3X80=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TNogUiNFXg8Qh+hf6b1UczQtXC9P+ad4wf2RqOFBAx6KW7g5YRNqS39Hf3aw?=
 =?us-ascii?Q?GeDZwPc/QDCs5rKKapQIOZg5ippcW/4IeRYQ3VVZv0uRySlJStOANQ0YFa2e?=
 =?us-ascii?Q?5xJTU1AFBsLvNB8xxRyAeCS1PRzkE44+7MxLqeXnrRUQbsne3rzkOXpz/XvN?=
 =?us-ascii?Q?8qQm+lowfl8mg4MlmJNMPO5SPT9+Wwrk0xdRfLT/SknM53k1wRCxf3xOL0Eo?=
 =?us-ascii?Q?wX8ps9gUwSCxEjSl/itqfnLNpK2ZakRth2UDDs/u2MyxkXNIGoZxZyVYDGPH?=
 =?us-ascii?Q?y6OGMR7s79Lym29kDbTcGKWj27bKxJXcwlN/26KOkhO4vyBJ94dh9i4oID+3?=
 =?us-ascii?Q?ud1hiD4LBliT0RsZUP0j4uvEwhBbmfPi6IuqYWgl4QBKQENUVHnjBHdjpCZL?=
 =?us-ascii?Q?ym6OXb7RrcWdGm2Cs04lbxCEQLLMJpMvVOLAAjKxVM8k7uF+hFykCWrr+6yW?=
 =?us-ascii?Q?JKdFvtaRw5/0u1ApFPbZP5Sqyi35/zjGmL9TYwc8YHsqmC9u8QGbCCTupaVj?=
 =?us-ascii?Q?C2kpyQHUsYisli2A+KKiuwPeH5J+wkO9/OMG6ExlDLSaqXRbXC9S0TKCFKhM?=
 =?us-ascii?Q?EuTvbM1IlxstAmxn90FxL5ho97UALyiZBCr6eks911+9dx34yH1YikrOsm21?=
 =?us-ascii?Q?IwR5qLVAP7Pq1CkG2rCSrIh09s7+wt15yxhLpBIHAETuDB0nRN4xhcm6Dw97?=
 =?us-ascii?Q?ltVSTx0dXw11DmxtNrT8Oa1IWV+cI7JfNK/RsFlfWmGKfBtrqKJlLndsvSdh?=
 =?us-ascii?Q?oXz9GVash6QB7NvXq0Pzheegt6zeDX8nZTSJrQgz0PxO3B5CSefHcF+QXhxT?=
 =?us-ascii?Q?bIEvcpokTRl2zK6K+zKmx26XWL/4I4f6zZ9Y2fle256D8rAyijwfedVodxH5?=
 =?us-ascii?Q?MO6NZQ5F6nXHj247f8z95FRuBF9+HghJKCLunJEmvBHgVTYQSs/xilsVPOR7?=
 =?us-ascii?Q?r6LWb8iVmF4VVjEidNNruNQD/glpEasQTSfG55ANJiqZOSKKRMingAFaaMuV?=
 =?us-ascii?Q?39J8QGJ1ep+N0Jelqf4UJIMjjFTX8zPGEM4GRVcq+TyFhu5qGgzvLH0mFe32?=
 =?us-ascii?Q?IY4VfO0Zz2hSPBUhnUot9cTRrZrt61o2g2P67fii9USzXZQ1zmdavjQ4FuMp?=
 =?us-ascii?Q?D96UHE4xrQdUft+o94oKVDapCdvXElqzlmCO3SksDXPsT1c6s+HP8tHPb13D?=
 =?us-ascii?Q?WjWfhUYqG6I7hdqtaypGJ5skFlBllcMdcVPN30i1YNCvkf0w8cJsoi9MJ1od?=
 =?us-ascii?Q?U7fQN5n06R507Dzd/3mF6+LsXBsMVKHCO282Ytf/iyFqDitmOxfWJFrjbxY+?=
 =?us-ascii?Q?FcT8v9Rp7KfVP1HOTPm0mwPDF7jE7jSM5g8w6EcWuFNa91odyJE3qxsvQE9o?=
 =?us-ascii?Q?ujYgX4OgZR7CpNW/atK50f19GJ4wnb9ghlsOfEY2eQyvEPpilsfxjTf/8uxr?=
 =?us-ascii?Q?2LW0gZ7r0VarlcduG6pUYet7+tC6nDMDqa/wlqDCrKsToNNvROJkZkayh7KJ?=
 =?us-ascii?Q?UurWP7xI3HbJjy45Lu9Kro8AtWKghXyuTNLxPpKyIl6X1nzdzWg5C1i4UHuA?=
 =?us-ascii?Q?+LbnkIjr7jf1jVij2oH+XUpM2yvImrpifQCeWW7bdGC6D660ZbWJlVZZKoi8?=
 =?us-ascii?Q?0w=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f3f45627-9bc3-4b9a-217b-08ddc2e58227
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 14:48:34.4699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cre3T+NbkxE16dlHgDE3qoEAOFJT3rc9ahRBvfhTzP/rLQoAUTxjST01T2wbjxhalqRT7YGiDL+25yrLaNY+hoIKrFaj74pqgB0DX/AECaU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7774
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 14 Jul 2025 14:48:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7324

Hi Robert,

On 7/9/25 1:40 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
>=20
> here:
>=20
> https://docs.yoctoproject.org/bitbake/2.12/bitbake-user-manual/bitbake-us=
er-manual-execution.html#preferences
>=20
> the closing note suggests that having an alternate "bleeding edge"
> version of a recipe is "common":
>=20
> "It is common for a recipe to provide two versions =E2=80=93 a stable,
> numbered (and preferred) version, and a version that is automatically
> checked out from a source code repository that is considered more
> =E2=80=9Cbleeding edge=E2=80=9D but can be selected only explicitly."
>=20
> then gives busybox as an example. not only does current busybox not
> have that structure, but there are almost *no* examples of this
> anymore throughout all of OE. i went looking for an example and the
> first one i found was xen in the meta-virt layer:
>=20
> https://git.yoctoproject.org/meta-virtualization/tree/recipes-extended/xe=
n
>=20
> so perhaps, first, this should be re-explained as something a
> developer *might* run across in their travels (but only rarely). but
> maybe a better approach is to leave this feature for later, and
> explain it in the context of how a developer can support this sort of
> thing for *their own* recipes in their own layer.
>=20
>    in any event, that note is clearly in need of updating given the
> almost total lack of such a thing in the current OE code base.
>=20

BB !=3D OE-Core so I don't think this justification stands here.

I would support moving the note to the variable glossary entry for=20
DEFAULT_PREFERENCE though.

There may be something we need to add to the Preferences section based=20
on the DEFAULT_PREFERENCE entry in the glossary as it seems to hint at=20
BBFILE_PRIORITY impacting it as well... And we don't specify any of this=20
behavior in the Preferences section. If that is still applicable to the=20
master branch, we should document it there as well.

Cheers,
Quentin

