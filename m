Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C70F7C48BC3
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 10:21:04 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.96])
 by mx.groups.io with SMTP id smtpd.web10.10252.1708424458414832951
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Feb 2024 02:20:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@theobroma-systems.com header.s=selector1 header.b=i4ny07WM;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.22.96, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cwMRjFg3eH/Uk63ylQLjPuH5qzvxoBWM/ale4nY/ID+JluVmoRhkpMsG111MhQBjwUugx/TRUeSyvMMIqpElC8Tc7xDV8BapSXHzZLwUIjs3XgQb1eN7ha3HGdCvn8LkG8XC4sLgSNhsaRgDMqun5b+rCQSF4lvJW3pgnSvQmOI+aiBEjQxOoXCnXTT9R2YgtQNIJc+7jC1F9I2ddxxzEXshH/nQM7ctvNj2200Dc4m5g1QdRmHgz7x9TDEEJmE5HIB9Peef6rPAf9IMPH+bcvXYwoaJ3f+xHp9n538s92pqNSU1FYFBDLU3xXz+bEuRoflAIHQ31tSeABP/4WESew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MVLRSKWlcyafk6n8P5CLqrIotqN1CoE5LPK3xlwPJjQ=;
 b=JX7DubiyukuNeoRF2BtuWZJnfFAsY5nDxHGMH1ZRVxgLunWtEtk+Qzn/gQ3jfKRRW0CphQiK9COZqVYUHIeGcnwVFLSp1Af1tfKW0hUONgWWltHqLQlB0N/D9zZBqixU0fV962Oc/n/x+VsfrA/OzHITaVVmB077lv+IzYnCYA1yZB817IreaZgrfJD0B8+qt5qqNqDXpKGodjc3bdh686fklq9ePnpQi3cNEKTL1kCYCcsDdmO6wvk7R7tFX2dVU2WCiT7FGuMDTmdyqbnqwYcsYv8h2wshePGMWCqtKejTxvxIvpdWaWlUDyhEacCuCZzeb6/XI7Nnu6SpbOzB5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MVLRSKWlcyafk6n8P5CLqrIotqN1CoE5LPK3xlwPJjQ=;
 b=i4ny07WMfW1bGooi44f4m878z+CWqMhzBUNliw09OAe72LQWBdDsa69ovI5Vot6i1TiMkS3mdqljMcZAessCbxgNd6hn5qyBnEAPxANu1o5IVnsCiW7DE4m/luOvhtjlIRrx9PnrzDtVqwNy9f3GN5mydfYU4N/yN2iMX4jb1SsBy+sOAMgo9P6ZO3KqJsTBk5teZsYPxUSRkwZuYLHrkAxyaks/0yGUgdivppDGQUEhjD4Y4SqOi+qBsuVFjOeDuF904+/4hovXrrpbDYvjTL4yJZwJ+y1juZDQtp/OqTzHaQEVwrjJ9KNkRNX9DXc5INsqwq+ehvgH4ehb09FSLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by PAXPR04MB8157.eurprd04.prod.outlook.com (2603:10a6:102:1cf::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.34; Tue, 20 Feb
 2024 10:20:54 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::550d:ad96:e3cb:9a6e]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::550d:ad96:e3cb:9a6e%5]) with mapi id 15.20.7292.036; Tue, 20 Feb 2024
 10:20:54 +0000
Message-ID: <619be673-eb4e-46e5-83d0-478e17ac2e9c@theobroma-systems.com>
Date: Tue, 20 Feb 2024 11:20:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual: tasks: do_cleanall: mention it is not
 allowed with a shared DL_DIR
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 luca.ceresoli@bootlin.com
CC: docs@lists.yoctoproject.org
References: <20240219155513.76738-1-luca.ceresoli@bootlin.com>
 <d7177c8d-756e-41ab-95aa-6e7b8ccb591b@theobroma-systems.com>
 <20240220085828.00300bdf@booty>
 <9b8bddd6a7eb48e2aadfdbc4ae5b2b8a5be7f280.camel@linuxfoundation.org>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <9b8bddd6a7eb48e2aadfdbc4ae5b2b8a5be7f280.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR4P281CA0425.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::12) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|PAXPR04MB8157:EE_
X-MS-Office365-Filtering-Correlation-Id: 382a7912-c4c8-491e-6502-08dc31fd9ec9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	U4JBNaLU8tV3CMJ3riScUpcBC3lIXUMuSbBynJy0mwt+dt4OgnOd8fp2FhEsJDZxsdw8CO2ITg5Bi76Wxdt9DASXnTQoztoSygJiRiD5GxEoW6lSz3BcS7/3X+xjcdb/GsWCZveSI1diZlgDiknEzqflhq5ONuN+AghAwfCvQKrInaka1yjU7u+mGAwJNgeON8BpAIaEFY0KAAUJyLAcsU4uk+7Cjt0m6xAwc+elxS5xvX0g5CU0ta0EDyqH+pTN2K0vxCm4qdVk7hsz37QEM7Lr81Kj323g6VrjcwHUlW3GnkQTQ4TeuOAi66eCAadwaery6wPdM5r109RT9YgS3w41c1R41Z8oVfV99O015dDj+6nzzBgN0hHN7jPug5zpzz1ZrAVyuyybr+soxl+m7tXM2J7pqCf7Mw5l22Bbqg9auWnS8EKSTZeeMQfa+mfgjj4vssoGnmy5QNsFhElbW03tyhatBfbnq5IyUuRP6MQpYNtosE3Nz5niZIcQcbcvmORVrB6ndUVgSP+glEzC3cpCUD1pxBEziYONlxYtr252CKlMgogC81mp+rcW4axn
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(230473577357003)(230273577357003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FVJL7AzXeoUGEyt/zAcJh1JPwWBWPkcnlTJWTxsNfGEfFgUlNStiFmTCipPq?=
 =?us-ascii?Q?to0g4P52Bu1hjzHdWXVrHxbKJqJSIhSzxbzC+pCm8/TS6hQx/fVuhTnAY/8A?=
 =?us-ascii?Q?Cqcep4xunmRosiOwaDnLGWbcx6s9j+TDyKSsal57bA4IAgcn7Zc4IciYuBzz?=
 =?us-ascii?Q?GTBdFz9sbzySAS5diWgI0ZrgyFXUXwawWE5b52KRteg2reADVZ5vxrd5I6PS?=
 =?us-ascii?Q?VU+lVWI81FBinSZE+3BAb3q3ysi4ukEw6ZePoaGrVmo0tEu9NXy5qJQ0n1bZ?=
 =?us-ascii?Q?czAWVUf6nUzoh5jZPVoSQIZz9odAnHPbqOpfwJR0qZsSf45u6soSiHQRuIg9?=
 =?us-ascii?Q?lTMrMdoMCtbfR1+gYd/VoUevSmJkKvTNWXA9c3MWjBkepEzLREOufZI90Q5k?=
 =?us-ascii?Q?NBSjWiNnPWEAbgs8Jb1roUm//8o2C/S4EorojaKwLxmG/7cOQKnqZR0K7WNB?=
 =?us-ascii?Q?7T7DiN4wt+dFJy6q4gfEGYg3m6HdZ47Le/GcSJzRU6g9EGOoT15BZleZJAUS?=
 =?us-ascii?Q?8XNn3LIc3hjQCqFhO4j07DpStwMQYufATKayrPE1E6KTsVHuc2GyLDfSAsmc?=
 =?us-ascii?Q?L9lJ2Lu9G9EV5vaFfFGIKE+0VRF1ViQaRHNfkTlPAvS6EnXxgu6uAsm+A9pW?=
 =?us-ascii?Q?iCovB8Hh2Ee1EM81jG0A2uosd7ctzU0ZwjEi9GXtrzwIoU6sSIjVv5GPJUr1?=
 =?us-ascii?Q?XKTtyN+H/+GbtgyEsqYx9/Cs0OYysTt3ggdUr5hZ2n4GBpq6UgPXN5+akhak?=
 =?us-ascii?Q?ai68wYnGoALwcoIgwkU1tFEpOXrIG8vE8khUCgs1vHr6c/bkN5tkQcbsV79C?=
 =?us-ascii?Q?r0zIWculheaBlwjEmwqVJpLrtox/KOvb4VskPi+cz0E0VlPVh3vrmq9L2j41?=
 =?us-ascii?Q?ACl+dAMw2OEJUsXvT/ssRS1JlgZX166oJOEyUdeT9kvcrhAKWBQK2ykEb7Qv?=
 =?us-ascii?Q?UOcxgL93VWA6xmqan+dAVaq3zcUrTFgsTlq/ooTnBufbAtF74ditChq6ttW0?=
 =?us-ascii?Q?WqfmrB4mMAf6u6PZ/dXe6PRn+QL5RcR6QzVICoyn/iKnHjGUaZj5S1PuCNWT?=
 =?us-ascii?Q?mTUO1o4iN1wWTho+9vRQqwdmVYHvFNKOFKMLG3EkghSrrKXwkAvMl8NJKLFy?=
 =?us-ascii?Q?y12XHoNCymyietxuxwI3AnXywmwitW31WY83Xr3qx6XMFbG/+r0wW8m9VaMX?=
 =?us-ascii?Q?MsgA+rcz+n8YgkkV7W+V/YZsuUwzfvmXemAMihYwvi2tZKgIwEqW5eUMrMwE?=
 =?us-ascii?Q?sSYl1rbNH7g5M/ayHTEKvkMj1Vd527o/XvLr6FKzo8avwMc1d6+InB5czvHv?=
 =?us-ascii?Q?oGZ9+UmBTsG85D2s1KcSOWdt6A0XPp4BDubY2ZGmp8SDhGEH7rP9+rh47qfm?=
 =?us-ascii?Q?XCn8PbLAg0PsgOHsz7kRbZW8+mAWZ9lnmbnDB/ndzPYBkGY7rNRTTMinleXu?=
 =?us-ascii?Q?tSG/9hvL58SE64ZN1hsRFBvAvgtVMsXxyl2lT46n4rFjk2/o8kZ05ae/oLee?=
 =?us-ascii?Q?iNfOU2JUoHlmSeRwiYMctCXzg3k3xt96C448/n9IDnqTA66dEMfa95rPNh2w?=
 =?us-ascii?Q?aDAr6Z6mm3fCXZkhFM5lZotAzMYyVCQRgPOmjlxHWdVCt0AMj0Voag7qe5sb?=
 =?us-ascii?Q?jmUzhGAFpqzGIRvF9f1CGKs=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 382a7912-c4c8-491e-6502-08dc31fd9ec9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 10:20:54.1964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: poNH6qeglTAdYjNnBaaZbSV4qIwTL4sC5K9rLjaTJEZk+RAQkof9OvaK84u1wQs5NCAizA1YUAGRv1B3L35KmDMy6/3GV0NPf7J17UoYmI4i0dBfuKNIURitJI30cQp3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8157
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 20 Feb 2024 10:21:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4850

Hi all,

On 2/20/24 10:01, Richard Purdie wrote:
> On Tue, 2024-02-20 at 08:58 +0100, Luca Ceresoli via
> lists.yoctoproject.org wrote:
>> Hi Quentin,
>>
>> On Mon, 19 Feb 2024 17:12:46 +0100
>> Quentin Schulz <quentin.schulz@theobroma-systems.com> wrote:
>>
>>> Hi Luca,
>>>
>>> On 2/19/24 16:55, Luca Ceresoli via lists.yoctoproject.org wrote:
>>>> [You don't often get email from
>>>> luca.ceresoli=3Dbootlin.com@lists.yoctoproject.org. Learn why this
>>>> is important at https://aka.ms/LearnAboutSenderIdentification=C2=A0]
>>>>
>>>> do_cleanall can produce failures if using a shared download
>>>> directory. This
>>>> is why it is forbidden when writing tests that will run on the
>>>> autobuilders
>>>> (
>>>> https://docs.yoctoproject.org/test-manual/intro.html?highlight=3Dcle
>>>> anall#considerations-when-writing-tests).
>>>>
>>>> Reported-by: Sam Liddicott
>>>> Link:
>>>> https://bootlin.com/blog/yocto-sharing-the-sstate-cache-and-download-d=
irectories/#comment-2650335
>>>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>>>> ---
>>>>  =C2=A0 documentation/ref-manual/tasks.rst | 13 +++++++++++++
>>>>  =C2=A0 1 file changed, 13 insertions(+)
>>>>
>>>> diff --git a/documentation/ref-manual/tasks.rst
>>>> b/documentation/ref-manual/tasks.rst
>>>> index 0db960b22f80..c754eb15514b 100644
>>>> --- a/documentation/ref-manual/tasks.rst
>>>> +++ b/documentation/ref-manual/tasks.rst
>>>> @@ -474,6 +474,19 @@ Typically, you would not normally use the
>>>> :ref:`ref-tasks-cleanall` task. Do so
>>>>  =C2=A0 if you want to start fresh with the :ref:`ref-tasks-fetch`
>>>>  =C2=A0 task.
>>>>
>>>> +.. note::
>>>> +
>>>> +=C2=A0=C2=A0 Never run the :ref:`ref-tasks-cleanall` task if your
>>>> :term:`DL_DIR` is
>>>
>>> This also applies if SSTATE_DIR is shared I believe?
>>
>> I don't think so. As far as I understand the sstate cache, a cache
>> entry is either found or not found, while for the downloads there is
>> the strange state of having a do_fetch stamp but no downloaded
>> archive.
>>
>> However I may be wrong. Do you have an example command sequence where
>> do_cleansstate can create a build failure?
>=20
> The builds check sstate "up front" then download later so it if is
> deleted in the meantime, it will cause an error but not a total failure
> as it will rebuild it.
>=20
> We therefore don't recommend cleansstate on a shared sstate directory.
> Instead you can use -f to invalidate a task.
>=20

And considering that cleanall also calls cleansstate (or at least does=20
the same), it applies and we should document it :)

Cheers,
Quentin

