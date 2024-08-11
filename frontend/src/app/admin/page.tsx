'use client'

import { useState, useEffect } from 'react'
import { useRouter } from 'next/navigation'
import styles from './Admin.module.css'

export default function Admin() {
    const [cotizaciones, setCotizaciones] = useState([])
    const [planes, setPlanes] = useState([])
    const [newPlan, setNewPlan] = useState('')
    const [error, setError] = useState('')
    const router = useRouter()

    useEffect(() => {
        const token = localStorage.getItem('access_token')

        if (!token) {
            router.push('/login')  // Redirige al login si no hay token
            return
        }

        const fetchCotizaciones = async () => {
            try {
                const response = await fetch('http://localhost/api/v1/cotizaciones/?skip=0&limit=100', {
                    headers: {
                        'Authorization': `Bearer ${token}`,
                    },
                })
                if (!response.ok) {
                    throw new Error('Error fetching cotizaciones')
                }
                const data = await response.json()
                setCotizaciones(data)
            } catch (error) {
                setError(error.message)
            }
        }

        const fetchPlanes = async () => {
            try {
                const response = await fetch('http://localhost/api/v1/cotizaciones/planes?skip=0&limit=100', {
                    headers: {
                        'Authorization': `Bearer ${token}`,
                    },
                })
                if (!response.ok) {
                    throw new Error('Error fetching planes')
                }
                const data = await response.json()
                setPlanes(data)
            } catch (error) {
                setError(error.message)
            }
        }

        fetchCotizaciones()
        fetchPlanes()
    }, [router])

    const handleLogout = () => {
        localStorage.removeItem('access_token')
        router.push('/login')  // Redirige al login después del logout
    }

    const fetchUpdatedPlanes = async () => {
        const token = localStorage.getItem('access_token')
        if (!token) return

        try {
            const response = await fetch('http://localhost/api/v1/cotizaciones/planes?skip=0&limit=100', {
                headers: {
                    'Authorization': `Bearer ${token}`,
                },
            })

            if (!response.ok) {
                throw new Error('Error fetching updated planes')
            }

            const data = await response.json()
            setPlanes(data)
        } catch (error) {
            setError(error.message)
        }
    }

    const handleCreatePlan = async () => {
        const token = localStorage.getItem('access_token')
        if (!token || !newPlan.trim()) return

        try {
            const response = await fetch('http://localhost/api/v1/cotizaciones/planes', {
                method: 'POST',
                headers: {
                    'Authorization': `Bearer ${token}`,
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ valor: newPlan }),
            })

            if (!response.ok) {
                throw new Error('Error creating plan')
            }

            await fetchUpdatedPlanes()
            setNewPlan('')
        } catch (error) {
            setError(error.message)
        }
    }

    if (error) {
        return <div className={styles.error}>Error: {error}</div>
    }

    return (
        <div className={styles.container}>
            <h1 className={styles.title}>Admin Panel</h1>
            <button className={styles.logoutButton} onClick={handleLogout}>Logout</button>

            <h2 className={styles.subtitle}>Cotizaciones</h2>
            {/* Renderizar cotizaciones aquí */}

            <h2 className={styles.subtitle}>Planes</h2>
            <div className={styles.createPlan}>
                <input
                    type="text"
                    value={newPlan}
                    onChange={(e) => setNewPlan(e.target.value)}
                    placeholder="Nuevo plan"
                    className={styles.input}
                />
                <button onClick={handleCreatePlan} className={styles.button}>Crear Plan</button>
            </div>

            {planes.map((plan) => (
                <div key={plan.id} className={styles.planItem}>
                    <span>ID: {plan.id} - Valor: {plan.valor}</span>
                </div>
            ))}
        </div>
    )
}
